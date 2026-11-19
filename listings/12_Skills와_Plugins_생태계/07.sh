# Claude가 생성한 코드
import sys
sys.path.insert(0, '.claude/skills/data-journalism')
from scripts.census_loader import load_population_data
from scripts.d3_generator import create_line_chart
# 데이터 로드
df = load_population_data(region="korea", years=range(2010, 2025))
# 고령화율 계산
df['aging_rate'] = df['population_65_plus'] / df['total_population'] * 100
# D3 차트 생성
create_line_chart(
data=df,
x='year',
y='aging_rate',
group_by='region',
title='지역별 고령화 추이 (2010-2024)',
output='aging_trend.html'
)
