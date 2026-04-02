# === 全局 Python 开发规范（适用于本机所有项目）===

## 绝对规则 - Python 包与环境管理
- 本机所有 Python 项目**必须**使用 **uv** 作为唯一的包管理器和环境管理工具。
- **严禁** 使用 `pip`、`python -m pip`、`pip install`、`poetry`、`conda`、`virtualenv` 或任何其他包管理命令。
- 安装新包：始终使用 `uv add <package>`（支持 extras，如 `uv add "fastapi[all]"`）
- 删除包：`uv remove <package>`
- 同步依赖：`uv sync`
- 运行 Python 脚本或命令：始终使用 `uv run ...`
  - 示例：`uv run python script.py`、`uv run pytest`、`uv run uvicorn main:app`
- 创建新项目：先 `uv init`，然后 `uv add` 添加依赖。
- 管理 Python 版本：`uv python install 3.12`、`uv run -p 3.12 ...`

## 虚拟环境
- 每个项目使用 uv 在项目目录下创建的 `.venv`（uv 会自动管理）。
- 不要手动激活 venv，直接用 `uv run` 即可。

## 其他强制要求
- 所有终端命令、工具调用、代码执行中涉及 Python 的部分，必须以 `uv` 开头。
- 如果我忘记使用 uv，请立即纠正并改用正确命令。
- 对于单文件脚本，优先考虑使用 PEP 723 inline script dependencies（以 # /// script 开头）。

此规则优先级最高，适用于本机任何目录下的 Python 项目。


# === 全局 Node.js / TypeScript 开发规范（适用于本机所有项目）===

## 绝对规则 - 包管理器
- 本机所有 Node.js 项目**必须**使用 **pnpm** 作为唯一的包管理器。
- **严禁** 使用 `npm`、`yarn`、`bun install`、`npm install`、`yarn add` 等命令。
- 安装依赖：
  - 添加生产依赖：`pnpm add <package>`
  - 添加开发依赖：`pnpm add -D <package>`（推荐写成 `pnpm add -D typescript @types/node`）
  - 删除依赖：`pnpm remove <package>`
- 安装所有依赖：`pnpm install`
- 更新 lockfile：`pnpm install`（不要用 `pnpm update` 随意更新）
- 运行脚本：始终使用 `pnpm run <script>`（例如 `pnpm run dev`、`pnpm run build`、`pnpm run typecheck`）

## 优先使用 TypeScript 的规则
- 所有新项目和新文件**默认使用 TypeScript**（.ts / .tsx）。
- 配置文件优先使用 `tsconfig.json`（严格模式推荐）。
- 永远不要创建纯 JavaScript 文件（.js / .jsx），除非用户明确要求或处理遗留代码。
- 添加 TypeScript 支持时，优先执行：`pnpm add -D typescript @types/node tsx @typescript-eslint/parser @typescript-eslint/eslint-plugin`
- 类型检查：始终运行 `pnpm run typecheck` 或 `tsc --noEmit`。
- 推荐使用 `tsx` 直接运行 TypeScript 文件：`pnpm exec tsx src/index.ts`

## 项目初始化推荐命令
- 新项目初始化：`pnpm init`
- 创建 TypeScript 项目：`pnpm create vite@latest` 或 `pnpm dlx create-next-app@latest --typescript`
- 安装核心类型：`pnpm add -D typescript @types/node`

## 其他强制要求
- 所有涉及包管理的终端命令，必须使用 pnpm。
- 如果我忘记使用 pnpm，请立即纠正并改用正确命令。
- 优先选择 TypeScript 最佳实践（严格类型、interface 而非 type alias 等，根据项目风格微调）。
- Next.js / Vite / Express 等项目默认开启 TypeScript。

此规则优先级最高，适用于本机任何目录下的 Node.js 项目。