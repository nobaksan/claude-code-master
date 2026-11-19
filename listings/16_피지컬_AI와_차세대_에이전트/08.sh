from omni.isaac.kit import SimulationApp
app = SimulationApp({"headless": True})  # 그래픽 창 없이 실행 (성능 최적화)

from omni.isaac.core import World
from omni.isaac.core.robots import Robot

# 1. 월드 및 바닥 생성
world = World(stage_units_in_meters=1.0)
world.scene.add_default_ground_plane()

# 2. 로봇 추가 (Franka Emika Panda 로봇 암)
robot = world.scene.add(
    Robot(
        prim_path="/World/Franka",
        name="franka",
        usd_path="/root/isaac-sim/assets/robots/franka.usd"
    )
)

# 3. 시나리오 실행
world.reset()
for i in range(300):
    world.step(render=False)
    # 여기서 로봇의 관절 상태(Joint Positions)를 읽어와
    # Claude에게 보고하고, Claude가 결정한 다음 각도값을
    # 모터에 전송하는 루프를 구성할 수 있다.

print("로봇 초기화 및 시뮬레이션 완료")
app.close()
