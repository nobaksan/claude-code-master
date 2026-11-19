// 선후 관계 및 필수 산출물을 정의한 워크플로 DAG
const advancedWorkflow = {
  requirement: {
    role: 'Requirement Analyst',
    depends: [],
    artifacts: ['artifacts/requirements.md'],
    next: ['ux', 'architect']
  },
  ux: {
    role: 'UX Designer',
    depends: ['requirement'],
    artifacts: ['artifacts/ux-design.md'],
    next: ['architect']
  },
  architect: {
    role: 'Tech Architect',
    depends: ['requirement', 'ux'],
    artifacts: ['artifacts/architecture.md', 'artifacts/api-contract.yaml'],
    next: ['planner', 'tester']
  },
  planner: {
    role: 'Planner',
    depends: ['architect'],
    artifacts: ['artifacts/tasks.json'],
    next: ['developer']
  },
  tester: {
    role: 'Test Designer',
    depends: ['architect'],
    artifacts: ['tests/unit.spec.ts'],
    next: ['developer']
  },
  developer: {
    role: 'Developer',
    depends: ['planner', 'tester'],
    artifacts: ['src/index.ts'],
    next: ['reviewer']
  },
  reviewer: {
    role: 'Reviewer',
    depends: ['developer'],
    artifacts: ['artifacts/review-report.md'],
    next: ['documenter']
  },
  documenter: {
    role: 'Documenter',
    depends: ['reviewer'],
    artifacts: ['README.md'],
    next: []
  }
};
