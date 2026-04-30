# Fix emoji corruption in test_utf8.html
# All file I/O uses explicit UTF-8 encoding

$srcPath = Join-Path $PSScriptRoot "test_utf8.html"
$dstPath = Join-Path $PSScriptRoot "index.html"

$c = [System.IO.File]::ReadAllText($srcPath, [System.Text.Encoding]::UTF8)

# ── MODS array id:2,3,4 ──
$c = $c.Replace('{id:2,lv:2,icon:"??",', '{id:2,lv:2,icon:"👔",')
$c = $c.Replace('{id:3,lv:2,icon:"???",', '{id:3,lv:2,icon:"🗺️",')
$c = $c.Replace('{id:4,lv:2,icon:"??",', '{id:4,lv:2,icon:"📋",')

# ── L1: AI 와 첫 만남 ──
$c = $c.Replace('[["??","ChatGPT","OpenAI",', '[["🤖","ChatGPT","OpenAI",')
$c = $c.Replace('["??","Claude","Anthropic",', '["💜","Claude","Anthropic",')
$c = $c.Replace('["??","Gemini","Google",', '["💎","Gemini","Google",')
$c = $c.Replace('>?? 팀장이 알아야 할 단 한 가지<', '>💡 팀장이 알아야 할 단 한 가지<')

# ── L2 Format: 핵심 형식 4가지 ──
$c = $c.Replace('{icon:"??",name:"표(Table)",', '{icon:"📊",name:"표(Table)",')
$c = $c.Replace('{icon:"??",name:"번호 리스트",', '{icon:"🔢",name:"번호 리스트",')
$c = $c.Replace('{icon:"??",name:"보고서 구조",', '{icon:"📄",name:"보고서 구조",')
$c = $c.Replace('{icon:"??",name:"이메일/문서",', '{icon:"📧",name:"이메일/문서",')

# ── L2 Format: 실전 템플릿 ──
$c = $c.Replace('{title:"CEO 보고용 ESG 전략 보고서",c:"#DC2626",icon:"??",', '{title:"CEO 보고용 ESG 전략 보고서",c:"#DC2626",icon:"📋",')
$c = $c.Replace('{title:"투자안 PCR 검토 보고서",c:"#CA8A04",icon:"??",', '{title:"투자안 PCR 검토 보고서",c:"#CA8A04",icon:"💰",')
$c = $c.Replace('{title:"Carbon Credit 분석 리포트",c:"#16A34A",icon:"??",', '{title:"Carbon Credit 분석 리포트",c:"#16A34A",icon:"🌿",')

# ── L3 Iterative ──
$c = $c.Replace('<SH>?? 반복적 개선', '<SH>🔄 반복적 개선')
$c = $c.Replace('{icon:"??",c:"#3B82F6",t:"디테일의 완성"', '{icon:"🔍",c:"#3B82F6",t:"디테일의 완성"')
$c = $c.Replace('{icon:"??",c:"#8B5CF6",t:"관점의 전환"', '{icon:"🔀",c:"#8B5CF6",t:"관점의 전환"')
$c = $c.Replace('{icon:"??",c:color,t:"오류 교정"', '{icon:"✅",c:color,t:"오류 교정"')
$c = $c.Replace('>? 3단계 기본 흐름<', '>🔄 3단계 기본 흐름<')

# ── L3 Few-Shot ──
$c = $c.Replace('{icon:"??",c:"#3B82F6",t:"답변의 일관성"', '{icon:"📌",c:"#3B82F6",t:"답변의 일관성"')
$c = $c.Replace('{icon:"?",c:"#8B5CF6",t:"복잡한 규칙 설명 생략"', '{icon:"💡",c:"#8B5CF6",t:"복잡한 규칙 설명 생략"')
$c = $c.Replace('{icon:"??",c:color,t:"데이터 형식 지정"', '{icon:"📊",c:color,t:"데이터 형식 지정"')
$c = $c.Replace('>? 핵심 한 줄 요약<', '>💡 핵심 한 줄 요약<')

# ── L4 Domain ──
$c = $c.Replace('session="?? 김팀장의 한 마디"', 'session="💡 김부장의 한 마디"')
$c = $c.Replace('<SH>??? 마스터 프롬프트 표준형', '<SH>⭐ 마스터 프롬프트 표준형')

# ── L4 Multimodal: 입력 유형 카드 ──
$c = $c.Replace('{icon:"???",t:"이미지"', '{icon:"🖼️",t:"이미지"')
$c = $c.Replace('{icon:"??",t:"PDF·문서"', '{icon:"📄",t:"PDF·문서"')
$c = $c.Replace('{icon:"??",t:"데이터 파일"', '{icon:"📊",t:"데이터 파일"')
$c = $c.Replace('{icon:"??",t:"텍스트 + 파일"', '{icon:"💬",t:"텍스트 + 파일"')

# ── L4 Multimodal: P2 이미지 분석 ──
$c = $c.Replace('session="??? 이미지를 AI에게 보여주면"', 'session="🖼️ 이미지를 AI에게 보여주면"')
$c = $c.Replace("icon=`"??`"`r`n        title=`"차트·그래프 → CEO 보고용 인사이트`"", "icon=`"📊`"`r`n        title=`"차트·그래프 → CEO 보고용 인사이트`"")
$c = $c.Replace("icon=`"??`"`r`n        title=`"화이트보드 사진 → 자동 회의록`"", "icon=`"📷`"`r`n        title=`"화이트보드 사진 → 자동 회의록`"")
$c = $c.Replace("icon=`"??`"`r`n        title=`"경쟁사 스크린샷 → 전략 분석`"", "icon=`"🖥️`"`r`n        title=`"경쟁사 스크린샷 → 전략 분석`"")

# ── L4 Multimodal: P3 문서 분석 ──
$c = $c.Replace('session="?? 문서를 통째로 올리면"', 'session="📄 문서를 통째로 올리면"')
$c = $c.Replace("icon=`"??`"`r`n        title=`"30페이지 보고서 → 임원 요약`"", "icon=`"📋`"`r`n        title=`"30페이지 보고서 → 임원 요약`"")
$c = $c.Replace("icon=`"??`"`r`n        title=`"계약서 → 불리한 조항 자동 검출`"", "icon=`"📝`"`r`n        title=`"계약서 → 불리한 조항 자동 검출`"")
$c = $c.Replace("icon=`"??`"`r`n        title=`"재무제표·감사보고서 → 투자 분석`"", "icon=`"💹`"`r`n        title=`"재무제표·감사보고서 → 투자 분석`"")

# ── L4 Multimodal: P4 데이터 분석 ──
$c = $c.Replace('session="?? 데이터 파일을 올리면"', 'session="📊 데이터 파일을 올리면"')
$c = $c.Replace("icon=`"??`"`r`n        title=`"매출 엑셀 → 인사이트 보고서`"", "icon=`"📈`"`r`n        title=`"매출 엑셀 → 인사이트 보고서`"")
$c = $c.Replace("icon=`"??`"`r`n        title=`"KPI 데이터 → 월간 달성률 보고서`"", "icon=`"🎯`"`r`n        title=`"KPI 데이터 → 월간 달성률 보고서`"")
$c = $c.Replace("icon=`"??`"`r`n        title=`"Scope 3 탄소 데이터 → ESG 감축 전략`"", "icon=`"🌿`"`r`n        title=`"Scope 3 탄소 데이터 → ESG 감축 전략`"")

$c = $c.Replace('<SH>?? 통합 시나리오', '<SH>🚀 통합 시나리오')

# ── L5 Advanced ──
$c = $c.Replace('<SH>?? 4가지 고급 패턴</SH>', '<SH>⭐ 4가지 고급 패턴</SH>')
$c = $c.Replace('<PatternCard icon="??" name="Meta-prompting"', '<PatternCard icon="🤖" name="Meta-prompting"')
$c = $c.Replace('<PatternCard icon="??" name="Self-consistency"', '<PatternCard icon="🎯" name="Self-consistency"')
$c = $c.Replace('<PatternCard icon="???" name="Role-Stacking"', '<PatternCard icon="🎭" name="Role-Stacking"')
$c = $c.Replace('<PatternCard icon="??" name="Persona Layering"', '<PatternCard icon="👤" name="Persona Layering"')
$c = $c.Replace('<SH>?? Level 1~4 vs Level 5</SH>', '<SH>⭐ Level 1~4 vs Level 5</SH>')
$c = $c.Replace('session="?? Meta-prompting이란?"', 'session="🤖 Meta-prompting이란?"')
$c = $c.Replace('<SH>?? Meta-prompting이 특히 유용한 상황', '<SH>💡 Meta-prompting이 특히 유용한 상황')
$c = $c.Replace('{icon:"??",t:"처음 해보는 업무"', '{icon:"🆕",t:"처음 해보는 업무"')
$c = $c.Replace('{icon:"??",t:"품질을 한 단계 높일 때"', '{icon:"🔝",t:"품질을 한 단계 높일 때"')
$c = $c.Replace('{icon:"?",t:"시간이 없을 때"', '{icon:"⏰",t:"시간이 없을 때"')
$c = $c.Replace('{icon:"??",t:"전문 도메인 진입 시"', '{icon:"🔬",t:"전문 도메인 진입 시"')

# ── L5 Workflow ──
$c = $c.Replace('<SH>??? 적용 가능한 6가지 업무 유형', '<SH>⚙️ 적용 가능한 6가지 업무 유형')
$c = $c.Replace('{icon:"??",t:"주간·월간 보고서"', '{icon:"📊",t:"주간·월간 보고서"')
$c = $c.Replace('{icon:"??",t:"이메일·커뮤니케이션"', '{icon:"📧",t:"이메일·커뮤니케이션"')
$c = $c.Replace('{icon:"??",t:"시장·경쟁사 분석"', '{icon:"🔍",t:"시장·경쟁사 분석"')
$c = $c.Replace('{icon:"??",t:"투자 의사결정"', '{icon:"💡",t:"투자 의사결정"')
$c = $c.Replace('{icon:"??",t:"회의록 자동화"', '{icon:"📝",t:"회의록 자동화"')
$c = $c.Replace('{icon:"??",t:"ESG 보고 자동화"', '{icon:"🌿",t:"ESG 보고 자동화"')

# ── L5 Leadership ──
$c = $c.Replace('<SH>??? AI 리더의 3가지 역할', '<SH>👥 AI 리더의 3가지 역할')
$c = $c.Replace('<LeadCard icon="??" title="AI 교육자"', '<LeadCard icon="📚" title="AI 교육자"')
$c = $c.Replace('<LeadCard icon="???" title="AI 환경 설계자"', '<LeadCard icon="🏗️" title="AI 환경 설계자"')
$c = $c.Replace('<LeadCard icon="??" title="AI 문화 리더"', '<LeadCard icon="🌟" title="AI 문화 리더"')
$c = $c.Replace('<SH>?? 혼자 잘하는 것 vs 조직 AI 리더십', '<SH>⭐ 혼자 잘하는 것 vs 조직 AI 리더십')
$c = $c.Replace('<SH>?? 팀원 AI 역량 4단계 진단표', '<SH>📊 팀원 AI 역량 4단계 진단표')
$c = $c.Replace('<SH>?? 단계별 맞춤 교육 프롬프트 3종', '<SH>💡 단계별 맞춤 교육 프롬프트 3종')
$c = $c.Replace('>?? 상황에 맞게 골라 쓰세요<', '>💡 상황에 맞게 골라 쓰세요<')
$c = $c.Replace('<SH>??? 조직 AI 문화 4가지 인프라', '<SH>🏗️ 조직 AI 문화 4가지 인프라')
$c = $c.Replace('{icon:"??",title:"팀 공유 라이브러리"', '{icon:"📚",title:"팀 공유 라이브러리"')
$c = $c.Replace('{icon:"??",title:"AI 활용 가이드라인"', '{icon:"📋",title:"AI 활용 가이드라인"')
$c = $c.Replace('{icon:"???",title:"주간 AI 공유 세션"', '{icon:"🗓️",title:"주간 AI 공유 세션"')
$c = $c.Replace('{icon:"??",title:"우수 사례 인정 시스템"', '{icon:"🏆",title:"우수 사례 인정 시스템"')

# ── L5 Future ──
$c = $c.Replace('<SH>?? 지속 학습이 필요한 3가지 이유', '<SH>📚 지속 학습이 필요한 3가지 이유')
$c = $c.Replace('{icon:"??",title:"AI 모델의 빠른 진화"', '{icon:"⚡",title:"AI 모델의 빠른 진화"')
$c = $c.Replace('{icon:"??",title:"규제 환경 변화"', '{icon:"⚖️",title:"규제 환경 변화"')
$c = $c.Replace('{icon:"??",title:"경쟁 우위 유지"', '{icon:"🎯",title:"경쟁 우위 유지"')
$c = $c.Replace('session="?? AI 트렌드 모니터링 시스템"', 'session="📡 AI 트렌드 모니터링 시스템"')
$c = $c.Replace('<SH>? 3단계 모니터링 루틴', '<SH>📅 3단계 모니터링 루틴')
$c = $c.Replace('{freq:"매일 10분",icon:"??",', '{freq:"매일 10분",icon:"☀️",')
$c = $c.Replace('{freq:"매주 30분",icon:"??",', '{freq:"매주 30분",icon:"📅",')
$c = $c.Replace('{freq:"매월 1시간",icon:"???",', '{freq:"매월 1시간",icon:"📆",')
$c = $c.Replace('<SH>?? AI로 AI 트렌드 파악하기 ? 매주 월요일 실행</SH>', '<SH>🔍 AI로 AI 트렌드 파악하기 → 매주 월요일 실행</SH>')
$c = $c.Replace('>?? 매주 월요일 아침 AI에게 실행', '>💡 매주 월요일 아침 AI에게 실행')
$c = $c.Replace('session="?? 나만의 평생 학습 루틴"', 'session="📚 나만의 평생 학습 루틴"')
$c = $c.Replace('<SH>??? 4단계 학습 리듬', '<SH>📅 4단계 학습 리듬')
$c = $c.Replace('{period:"매일 아침 10분",icon:"??",', '{period:"매일 아침 10분",icon:"☀️",')
$c = $c.Replace('{period:"매주 금요일 30분",icon:"??",', '{period:"매주 금요일 30분",icon:"📅",')
$c = $c.Replace('{period:"매월 1시간",icon:"??",', '{period:"매월 1시간",icon:"📆",')
$c = $c.Replace('{period:"분기 반나절",icon:"??",', '{period:"분기 반나절",icon:"🗓️",')
$c = $c.Replace('<SH>??? 다음 4가지 여정', '<SH>🚀 다음 4가지 여정')
$c = $c.Replace('{icon:"??",title:"AI 에이전트 심화"', '{icon:"🤖",title:"AI 에이전트 심화"')
$c = $c.Replace('{icon:"??",title:"업계 도메인 특화"', '{icon:"🏭",title:"업계 도메인 특화"')
$c = $c.Replace('{icon:"??",title:"강의·멘토링 시작"', '{icon:"👨‍🏫",title:"강의·멘토링 시작"')
$c = $c.Replace('{icon:"??",title:"AI 커뮤니티 참여"', '{icon:"🌐",title:"AI 커뮤니티 참여"')
$c = $c.Replace('<div style={{fontSize:40,marginBottom:8}}>??</div>', '<div style={{fontSize:40,marginBottom:8}}>🎓</div>')

# ── session="?? 김실장의 첫 마디" (L5Advanced + L5Leadership) ──
$c = $c.Replace('session="?? 김실장의 첫 마디"', 'session="💡 김실장의 첫 마디"')

# ── Library: 관리 도구 ──
$c = $c.Replace('{icon:"??",name:"Notion",', '{icon:"📓",name:"Notion",')
$c = $c.Replace('{icon:"??",name:"Excel / 스프레드시트",', '{icon:"📊",name:"Excel / 스프레드시트",')
$c = $c.Replace('{icon:"??",name:"Google Docs",', '{icon:"📄",name:"Google Docs",')
$c = $c.Replace('{icon:"??",name:"텍스트 파일",', '{icon:"📝",name:"텍스트 파일",')

# ── Library: 성장 단계 ──
$c = $c.Replace('{icon:"??",step:"씨앗"', '{icon:"🌱",step:"씨앗"')
$c = $c.Replace('{icon:"??",step:"성장"', '{icon:"🌿",step:"성장"')
$c = $c.Replace('{icon:"??",step:"성숙"', '{icon:"🌳",step:"성숙"')
$c = $c.Replace('{icon:"??",step:"마스터"', '{icon:"👑",step:"마스터"')

# ── Error messages ──
$c = $c.Replace('다시 시도해주세요. ??"}])', '다시 시도해주세요. 🔄"}])')
$c = $c.Replace('\n\n? 초기화 버튼을 누르고 다시 시도해주세요. ??', '\n\n💡 초기화 버튼을 누르고 다시 시도해주세요. 🔄')

# ── Revert word changes: 김팀장 → 김부장 ──
$c = $c.Replace('김팀장', '김부장')

# Write final file as UTF-8 without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($dstPath, $c, $utf8NoBom)

Write-Host "Done! Wrote to index.html"

# Verify remaining ?? count
$remaining = ([regex]::Matches($c, '\?\?')).Count
Write-Host "Remaining ?? count: $remaining"
