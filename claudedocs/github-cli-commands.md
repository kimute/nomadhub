# GitHub CLI 명령어 가이드

GitHub CLI (`gh`)를 사용한 리포지토리 관리 및 라벨 설정 가이드

## 목차
- [리포지토리 생성](#리포지토리-생성)
- [브랜치 관리](#브랜치-관리)
- [라벨 관리](#라벨-관리)
- [리포지토리 조회](#리포지토리-조회)
- [유용한 명령어](#유용한-명령어)

---

## 리포지토리 생성

### 기본 생성 명령어

```bash
# 공개 리포지토리 생성
gh repo create repository-name --public

# 비공개 리포지토리 생성
gh repo create repository-name --private

# 현재 디렉토리를 리포지토리로 생성 (공개)
gh repo create repository-name --public --source=. --push

# 현재 디렉토리를 리포지토리로 생성 (비공개)
gh repo create repository-name --private --source=. --push
```

### 옵션 포함 생성

```bash
# README 파일 포함
gh repo create repository-name --public --add-readme

# 설명 추가
gh repo create repository-name --public --description "프로젝트 설명"

# .gitignore 템플릿 포함
gh repo create repository-name --public --gitignore Node

# 라이선스 포함
gh repo create repository-name --public --license mit

# 모든 옵션 조합
gh repo create repository-name \
  --public \
  --description "프로젝트 설명" \
  --add-readme \
  --gitignore Node \
  --license mit
```

### 대화형 생성 (추천)

```bash
# 대화형 프롬프트로 생성
gh repo create
```

### 실제 사용 예시

```bash
# NomadHub 프로젝트 생성 (개인 프로젝트용)
gh repo create nomadhub --public --source=. --push
```

---

## 브랜치 관리

GitHub CLI는 브랜치를 직접 생성하지 않습니다. Git 명령어를 사용해야 합니다.

### 브랜치 생성 및 전환

```bash
# 브랜치 생성 및 전환 (기존 방식)
git checkout -b feature/branch-name

# 브랜치 생성 및 전환 (최신 방식)
git switch -c feature/branch-name

# 원격에 푸시
git push -u origin feature/branch-name
```

### 브랜치 조회

```bash
# 로컬 브랜치 목록
git branch

# 원격 브랜치 목록
git branch -r

# 모든 브랜치 목록
git branch -a
```

### 일반적인 워크플로우

```bash
# 1. 새 브랜치 생성 및 전환
git checkout -b feature/new-feature

# 2. 작업 수행 후 커밋
git add .
git commit -m "Add new feature"

# 3. 원격에 푸시
git push -u origin feature/new-feature

# 4. PR 생성 (GitHub CLI 사용)
gh pr create --title "Add new feature" --body "Description"
```

---

## 라벨 관리

### 기본 라벨 생성

```bash
# 기본 형식
gh label create "라벨명" --color "색상코드" --description "설명"

# 예시
gh label create "bug" --color "d73a4a" --description "Something isn't working"
```

### NomadHub 프로젝트 라벨 세트

#### 개발 영역 (Development Area)

```bash
gh label create "area: frontend" --color "0E8A16" --description "Frontend development"
gh label create "area: backend" --color "1D76DB" --description "Backend development"
gh label create "area: infrastructure" --color "FBCA04" --description "Infrastructure and DevOps"
```

#### 복잡도 (Complexity)

```bash
gh label create "complexity: easy" --color "C2E0C6" --description "Easy to implement"
gh label create "complexity: medium" --color "FEF2C0" --description "Moderate complexity"
gh label create "complexity: hard" --color "F9D0C4" --description "Complex implementation"
```

#### 작업 유형 (Work Type)

```bash
gh label create "type: documentation" --color "0075CA" --description "Documentation improvements"
gh label create "type: feature" --color "A2EEEF" --description "New feature or enhancement"
gh label create "type: bugfix" --color "D73A4A" --description "Bug fix"
gh label create "type: test" --color "BFD4F2" --description "Testing related"
gh label create "type: refactor" --color "EDEDED" --description "Code refactoring"
```

### 모든 라벨 한 번에 생성

```bash
gh label create "area: frontend" --color "0E8A16" --description "Frontend development" && \
gh label create "area: backend" --color "1D76DB" --description "Backend development" && \
gh label create "area: infrastructure" --color "FBCA04" --description "Infrastructure and DevOps" && \
gh label create "complexity: easy" --color "C2E0C6" --description "Easy to implement" && \
gh label create "complexity: medium" --color "FEF2C0" --description "Moderate complexity" && \
gh label create "complexity: hard" --color "F9D0C4" --description "Complex implementation" && \
gh label create "type: documentation" --color "0075CA" --description "Documentation improvements" && \
gh label create "type: feature" --color "A2EEEF" --description "New feature or enhancement" && \
gh label create "type: bugfix" --color "D73A4A" --description "Bug fix" && \
gh label create "type: test" --color "BFD4F2" --description "Testing related" && \
gh label create "type: refactor" --color "EDEDED" --description "Code refactoring"
```

### 라벨 조회 및 관리

```bash
# 라벨 목록 확인
gh label list

# 라벨 수정
gh label edit "라벨명" --color "새색상" --description "새설명"

# 라벨 삭제
gh label delete "라벨명"

# 라벨 삭제 (확인 없이)
gh label delete "라벨명" --yes
```

---

## 리포지토리 조회

### 브라우저에서 열기

```bash
# 현재 리포지토리를 브라우저에서 열기
gh repo view --web

# 특정 브랜치 확인
gh repo view --branch branch-name
```

### 리포지토리 정보 확인

```bash
# 리포지토리 정보 출력
gh repo view

# 간단한 정보만 출력
gh repo view --json name,description,url
```

---

## 유용한 명령어

### Git 초기화 및 첫 커밋

```bash
# Git 초기화
git init

# 모든 파일 추가
git add .

# 첫 커밋
git commit -m "Initial commit: Project setup"

# 리포지토리 생성 및 푸시
gh repo create repository-name --public --source=. --push
```

### Remote URL 변경 (SSH ↔ HTTPS)

```bash
# 현재 remote 확인
git remote -v

# SSH → HTTPS로 변경
git remote set-url origin https://github.com/username/repository.git

# HTTPS → SSH로 변경
git remote set-url origin git@github.com:username/repository.git

# 변경 후 푸시
git push -u origin main
```

### Pull Request 관리

```bash
# PR 생성
gh pr create --title "제목" --body "내용"

# PR 목록 확인
gh pr list

# PR 확인
gh pr view PR번호

# PR 체크아웃
gh pr checkout PR번호

# PR 병합
gh pr merge PR번호
```

### Issue 관리

```bash
# Issue 생성
gh issue create --title "제목" --body "내용"

# Issue에 라벨 추가
gh issue create --title "제목" --body "내용" --label "type: feature,area: frontend"

# Issue 목록 확인
gh issue list

# Issue 확인
gh issue view Issue번호

# Issue 닫기
gh issue close Issue번호
```

---

## 색상 코드 참고

라벨 생성 시 사용할 수 있는 색상 코드:

| 색상 | 코드 | 용도 |
|------|------|------|
| 🔴 빨강 | `d73a4a` | 버그, 긴급, 복잡함 |
| 🟠 주황 | `FBCA04` | 주의, 인프라 |
| 🟡 노랑 | `FEF2C0` | 보통 복잡도 |
| 🟢 초록 | `0E8A16` | 프론트엔드, 쉬움 |
| 🔵 파랑 | `1D76DB` | 백엔드, 문서 |
| 🟣 보라 | `5319E7` | 풀스택 |
| ⚪ 회색 | `EDEDED` | 리팩토링, 중립 |
| 🔷 하늘 | `A2EEEF` | 기능, 개선 |
| 🔹 연한 파랑 | `BFD4F2` | 테스트 |
| 🟩 연한 초록 | `C2E0C6` | 쉬운 작업 |

---

## 트러블슈팅

### SSH 인증 실패 시

```bash
# HTTPS로 변경
git remote set-url origin https://github.com/username/repository.git
git push -u origin main
```

### Git이 초기화되지 않은 경우

```bash
# Git 초기화 및 첫 커밋
git init
git add .
git commit -m "Initial commit"

# 리포지토리 생성
gh repo create repository-name --public --source=. --push
```

### 라벨이 이미 존재하는 경우

```bash
# 기존 라벨 삭제 후 재생성
gh label delete "라벨명" --yes
gh label create "라벨명" --color "색상" --description "설명"

# 또는 수정
gh label edit "라벨명" --color "새색상" --description "새설명"
```

---

## 참고 자료

- [GitHub CLI 공식 문서](https://cli.github.com/manual/)
- [GitHub CLI 설치](https://github.com/cli/cli#installation)
- [GitHub 라벨 관리 가이드](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels)
