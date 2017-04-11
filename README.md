# 중앙대학교 컴퓨터 공학부 데이터베이스설계 프로젝트

목적 : 중앙대학교 내에 있는 서버실의 자산과 서비스 전체를 데이터베이스화 시키고 그것들을 관리하는 Admin 페이지를 웹으로 구현한다.

## 모델 구조 설계
1. 자산(Asset)
    1. 서버(Server)
        1. belongs_to 자산(Asset)
    2. 스위치(Switch)
        1. belongs_to 자산(Asset)
    3. 스토리지(Storage)
        1. belongs_to 자산(Asset)
        2. has_many 할당(Allocation) through: 스토리지정보(StorageInfo)
    4. 랙(Box)
        1. belongs_to 자산(Asset)
        2. has_one 스위치(Switch) or 서버(Server) through: 랙정보(BoxInfo)
2. 서비스(ServiceUsing)
    1. has_many 랙정보(BoxInfo)
    2. has_many 스토리지정보(StorageInfo)
3. 비서비스(ServiceNotusing)
    1. 

By Astro, 최현경, 김나니, 김지연, 조나영, eun ji