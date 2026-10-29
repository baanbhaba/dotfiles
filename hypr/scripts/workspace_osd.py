#!/usr/bin/env python3
import os
import socket
import subprocess
import time

def get_socket_path():
    sock_dir = os.environ.get("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
    sig = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
    if not sig:
        hypr_dir = os.path.join(sock_dir, "hypr")
        if os.path.exists(hypr_dir):
            entries = [e for e in os.listdir(hypr_dir) if not e.startswith(".")]
            if entries:
                sig = entries[0]
    if sig:
        return os.path.join(sock_dir, "hypr", sig, ".socket2.sock")
    return None

def main():
    while True:
        sock_path = get_socket_path()
        if not sock_path or not os.path.exists(sock_path):
            time.sleep(1)
            continue
            
        try:
            s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            s.connect(sock_path)
            buffer = ""
            while True:
                data = s.recv(4096)
                if not data:
                    break
                buffer += data.decode("utf-8", errors="ignore")
                while "\n" in buffer:
                    line, buffer = buffer.split("\n", 1)
                    if line.startswith("workspacev2>>"):
                        # Play tactile sound for active theme
                        sound_path = os.path.expanduser("~/.config/hypr/sounds/current/workspace.wav")
                        if not os.path.exists(sound_path):
                            sound_path = os.path.expanduser("~/.config/hypr/sounds/click.wav")

                        mute_file = os.path.expanduser("~/.config/hypr/.sounds_muted")
                        if not os.path.exists(mute_file) and os.path.exists(sound_path):
                            subprocess.Popen(
                                ["paplay", sound_path],
                                stdout=subprocess.DEVNULL,
                                stderr=subprocess.DEVNULL
                            )
                        # Display OSD
                        payload = line[len("workspacev2>>"):]
                        name = payload.split(",")[-1]
                        subprocess.Popen(
                            ["swayosd-client", "--custom-message", f"Workspace {name}", "-d", "350"],
                            stdout=subprocess.DEVNULL,
                            stderr=subprocess.DEVNULL
                        )
                        # Reap any terminated children to prevent zombie processes
                        try:
                            while os.waitpid(-1, os.WNOHANG)[0] > 0:
                                pass
                        except ChildProcessError:
                            pass
        except Exception:
            time.sleep(1)

if __name__ == "__main__":
    main()
