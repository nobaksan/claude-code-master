# scripts/create_gif.py
#!/usr/bin/env python3
"""Slack 최적화 GIF 생성기"""
import argparse
from pathlib import Path
from PIL import Image
import subprocess
def create_gif(input_dir: Path, output_path: Path,
               fps: int = 10, max_size_mb: float = 2.0):
    """
    이미지 시퀀스에서 GIF 생성
    Args:
        input_dir: 이미지가 있는 디렉터리
        output_path: 출력 GIF 경로
        fps: 초당 프레임 수
        max_size_mb: 최대 파일 크기 (MB)
    """
    images = sorted(input_dir.glob("*.png"))
    if not images:
        raise ValueError(f"No images found in {input_dir}")
    # PIL로 GIF 생성
    frames = [Image.open(img) for img in images]
    duration = int(1000 / fps)
    frames[0].save(
        output_path,
        save_all=True,
        append_images=frames[1:],
        duration=duration,
        loop=0,
        optimize=True
    )
    # 크기 검증 및 최적화
    size_mb = output_path.stat().st_size / (1024 * 1024)
    if size_mb > max_size_mb:
        optimize_gif(output_path, max_size_mb)
    return output_path
def optimize_gif(path: Path, target_mb: float):
    """gifsicle을 사용한 손실 압축"""
    subprocess.run([
        "gifsicle", "-O3", "--lossy=80",
        "-o", str(path), str(path)
    ], check=True)
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--fps", type=int, default=10)
    args = parser.parse_args()
    create_gif(args.input, args.output, args.fps)
