"hooks": {
  "Stop": [{
    "hooks": [{
      "type": "command",
      "command": "npm test 2>&1 | head -50 || exit 2",
      "timeout": 30
    }]
  }]
}
