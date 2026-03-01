# OpenClaw Configuration Templates

Public configuration templates and memory architecture examples for OpenClaw agent.

## Contents

- `AGENTS.md` - Agent behavior and workflow rules
- `TOOLS.md` - Tool usage patterns and web access flow
- `HEARTBEAT.md` - Periodic task configuration
- `MEMORY.md` - Memory switchboard architecture
- `memory/` - Daily logs and atomic domain files
- `skills/` - Custom agent skills

## Memory Architecture: Total Recall v2

This setup uses an atomic domain architecture:
- `MEMORY.md` = Switchboard (index only, no rules)
- `memory/@*.md` = Atomic domain files (holistic rules)
- `memory/YYYY-MM-DD.md` = Daily episodic logs

## License

MIT
