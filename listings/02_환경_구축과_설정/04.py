import subprocess
import json
from pathlib import Path
def claude_analyze_directory(directory: Path, instruction: str) -> dict:
    """Claude Code를 프로그래밍적으로 호출하는 예제"""
    result = subprocess.run(
        ["claude", "-p", instruction, "--output-format", "json"],
        cwd=directory,
        capture_output=True,
        text=True,
        timeout=300 # 5분 타임아웃
    )
    if result.returncode != 0:
        raise RuntimeError(f"Claude Code 실행 실패: {result.stderr}")
    return json.loads(result.stdout)
# 활용 예: 여러 프로젝트를 순회하며 기술 부채 분석
projects = Path("/workspace").glob("*/")
for project in projects:
    analysis = claude_analyze_directory(
        project,
        "이 프로젝트의 기술 부채를 분석하고 우선순위를 매겨줘"
    )
    print(f"{project.name}: {analysis['result']}")
