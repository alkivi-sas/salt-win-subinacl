subinacl-test:
  file.managed:
    - name: c:\alkivi\packages\subinacl\test.ps1
    - source: salt://subinacl/templates/test.ps1
    - makedirs: True

subinacl-packages:
  file.managed:
    - name: c:\alkivi\packages\subinacl\subinacl.msi
    - source: https://download.microsoft.com/download/1/7/d/17d82b72-bc6a-4dc8-bfaa-98b37b22b367/subinacl.msi
    - source_hash: sha256=56d0678ba79303f141c2962babba53dfb87205467284e35047cc13ffa720f6c6
    - makedirs: True
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\subinacl\test.ps1

subinacl-install:
  cmd.run:
    - name: msiexec.exe /i subinacl.msi /quiet /norestart
    - cwd: c:\alkivi\packages\subinacl\
    - shell: powershell
    - unless: powershell -NoProfile -ExecutionPolicy Bypass -Command c:\alkivi\packages\subinacl\test.ps1
    - require:
      - file: c:\alkivi\packages\subinacl\subinacl.msi

subinacl-path:
  win_path.exists:
    - name: c:\program files (x86)\windows resource kits\tools\
