# Upstream

| | |
| --- | --- |
| Project | secDevLabs (Globo.com) |
| Repository | https://github.com/globocom/secDevLabs |
| App | `owasp-top10-2021-apps/a4/super-recovery-password` |
| Version | master (secDevLabs has no releases) |
| Commit | 10be438496e928c66567749f0aaf0bb976052bc9 |
| Licence | BSD-3-Clause |

The app folder [`owasp-top10-2021-apps/a4/super-recovery-password`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a4/super-recovery-password) of that commit is vendored unchanged, without its Git history,
split so that each part sits in the build folder of the machine that uses it:

| Upstream path (in the app folder) | Here |
| --- | --- |
| `src/app/` | `build/app/app/` |
| `src/api/` | `build/api/app/` |
| everything else (README, Makefile, deployments, brute-force, images) | `app/` |

Each `build/<machine>/Dockerfile` says in its header comment how it differs from upstream:

- `build/app/`: upstream's `deployments/app.Dockerfile` with the environment of upstream's compose file baked in and `CI=true`, so the development server keeps running without the terminal upstream's compose file attaches (`stdin_open: true`).
- `build/api/`: upstream's `deployments/api.Dockerfile` with the base image pinned to `golang:1.23` (upstream takes the latest), the environment of upstream's compose file baked in, a compile at build time so `go run` starts offline, and the compose command as `CMD`.
- `build/db/`: the `mariadb:10.6.3` service of upstream's compose file with its environment baked in. Upstream also mounts `../db` as init scripts, a folder its `.gitignore` excludes; the API creates its table and users itself.
- The page calls the API at `http://localhost:3000`, so the API keeps upstream's published port. Upstream's `brute-force/` tool (the attacker side) is vendored in `app/` but not run.

To update, replace the vendored folders with a newer secDevLabs commit, then change this file.
