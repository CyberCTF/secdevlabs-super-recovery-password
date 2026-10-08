# secDevLabs Super Recovery Password

[secDevLabs](https://github.com/globocom/secDevLabs)' [`owasp-top10-2021-apps/a4/super-recovery-password`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a4/super-recovery-password) app, by Globo.com and the
secDevLabs contributors: a React app with a Go API and MariaDB whose password recovery is an Insecure Design flaw: it reveals which logins exist, relies on guessable security questions and never limits attempts. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, built from
the vendored app folder (see [UPSTREAM.md](UPSTREAM.md)).

| Machine | Service |
| --- | --- |
| app | the React page (development server) on port 40001 |
| api | the Go API on port 3000 |
| db | MariaDB 10.6.3 on port 3306 (lab network only) |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:40001/. The page calls the API at http://localhost:3000/. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the app's
[README](https://github.com/globocom/secDevLabs/blob/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a4/super-recovery-password/README.md), with the attack narrative and the secDevLabs walkthrough.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as secDevLabs ([LICENSE](LICENSE)). The third-party software inside the images keeps
its own licence. This application is deliberately vulnerable: keep it isolated.
