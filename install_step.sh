#claude code linux/macos
curl -fsSL https://claude.ai/install.sh | bash
#claude code win
irm https://claude.ai/install.ps1 | iex
#https://github.com/anthropics/skills
#in claude
/plugin marketplace add anthropics/skills

npm i -g agent-browser
npm i -g skills
skills add vercel-labs/agent-browser --skill agent-browser