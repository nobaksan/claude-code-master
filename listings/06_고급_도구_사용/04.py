# Claude가 작성하는 코드 (코드 실행 환경에서 실행됨)
import asyncio
import json
async def check_budget_compliance():
    # 1. 팀원 정보 가져오기
    team = await get_team_members("engineering")
    # 2. 모든 팀원의 경비를 병렬로 조회
    # 전통적 방식에서는 순차적으로 21번 호출했지만,
    # 여기서는 한 번에 모두 요청한다
    expenses = await asyncio.gather(*[
        get_expenses(member["id"], "Q3")
        for member in team
    ])
    # 3. 예산 기준 정의
    budget_limits = {
        "junior": {"travel": 2000, "equipment": 500},
        "senior": {"travel": 3500, "equipment": 1000},
        "lead": {"travel": 5000, "equipment": 2000}
    }
    # 4. 예산 초과자만 필터링 - 핵심 로직!
    exceeded = []
    for member, exp_list in zip(team, expenses):
        travel_total = sum(
            e["amount"] for e in exp_list
            if e["category"] == "travel"
        )
        limit = budget_limits[member["level"]]["travel"]
        if travel_total > limit:
            exceeded.append({
                "name": member["name"],
                "level": member["level"],
                "spent": travel_total,
                "limit": limit,
                "overage": travel_total - limit
            })
    # 5. 결과 반환 - Claude는 이것만 본다
    return exceeded
result = await check_budget_compliance()
print(json.dumps(result, indent=2))
