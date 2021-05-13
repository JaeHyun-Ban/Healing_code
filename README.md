

# Project - Healing
- [Healing_Final](https://github.com/JaeHyun-Ban/Healing_Final)
팀프로젝트 결과물
- [TeamProject_Record](https://github.com/JaeHyun-Ban/TeamProject_Record)
프로젝트 진행 중 작성한 기록

- [프로젝트 실행영상](https://www.youtube.com/watch?v=ekC01lIsz0M&ab_channel=Mulia)

![image](https://user-images.githubusercontent.com/60961649/117704978-7193ed80-b206-11eb-8bd4-5e762642574c.png)


이 프로젝트는 국비과정 마지막에 진행된 프로젝트입니다

사용자들이 힐링을 위해 여행을 떠날 때 좋은 숙박시설을 찾을 수 있도록 만들었습니다.

---

## 목차
- 프로젝트 소개
- 개발환경, 사용 도구
- 


---

### 프로젝트 소개

- 개발기간: 2021.01.05 ~ 2021.01.28
- 참여인원: 4명
- 담당업무: 팀장: 제안, 기획, Framework 설계, DB 설계, 디자인

---

### 개발환경, 개발도구
- 개발환경
  - eclipse
  - VSCode
- 개발도구
  - Backend
      - Java 8
      - Spring MVC2 Model
      - Oracle 18c(SQL)
   
   - Frontend
     - HTML5
     - CSS
     - JavaScript
     - JQuery
- ETC
  - Git(협업)
  
--- 

### 설명
[프로젝트의 draw.io로 이동](https://drive.google.com/file/d/11hfCJgL-oQzG4CAst2sfZahFVTJ6hVA-/view?usp=sharing)

프로젝트 진행기간은 코로나로 인해 원격수업을 진행하던 상황이였습니다.

팀장으로써 소통을 하다보니 진행과정 대화에 있어 오류가 많이 발생하여 그것을 막기위해 **직관적이며 일관된 설명이 필요**하다고 생각하여 만들게 되었습니다.

### 화면 설계도
![](https://images.velog.io/images/wogus0808/post/ac6d0b00-224d-4f62-92f9-4dcd0db96732/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84_%EB%B3%B5%EC%82%AC-%ED%99%94%EB%A9%B4%EC%84%A4%EA%B3%84.jpg)

### DB - ERD모델링
![](https://images.velog.io/images/wogus0808/post/b21d7ddf-636b-4db0-97a7-e3a2461ab499/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84_%EB%B3%B5%EC%82%AC-DB_ER%EB%8B%A4%EC%9D%B4%EC%96%B4%EA%B7%B8%EB%9E%A8%20(1).jpg)


- 프로젝트 와이어 프레임(기초)
  - 화면UI를 구현하는데 있어 서로가 생각하는 것이 차이나는 것을 방지하기 위해 만들었습니다
  - 이 프로젝트를 통해 와이어 프레임이라는 것을 배웠습니다.
![](https://images.velog.io/images/wogus0808/post/6739096c-f205-4748-be29-81cf017c4a08/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84_%EB%B3%B5%EC%82%AC-%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84.jpg)

### 프로젝트 와이어 프레임(디테일)
  - 기존 와이어프레임에 세부적인 디테일을 추가하였습니다.
![](https://images.velog.io/images/wogus0808/post/71563060-7b27-487e-a63b-aea8244322ec/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8_%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84_%EB%B3%B5%EC%82%AC-%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84_%EB%94%94%ED%85%8C%EC%9D%BC.jpg)

--- 

### 카카오 로그인 처리

![](https://images.velog.io/images/wogus0808/post/b14f201e-c8b8-46ac-8f7f-e23513f3c71c/kakao_login.gif)

- [코드확인](https://github.com/JaeHyun-Ban/etc/blob/master/Healing/src/main/webapp/WEB-INF/views/user/login.jsp#L124)
- 카카오로 회원가입시 일반 회원가입과 구분할 필요성이 있었습니다.
 이를 위해 저장 시 맨 뒤에 '@k'를 붙여 카카오로 가입했다는 표시를 남겼습니다.
- ![image](https://user-images.githubusercontent.com/60961649/117908953-51525480-b314-11eb-8da2-e07a8f6d4924.png)


---

### 회원가입 처리

![](https://images.velog.io/images/wogus0808/post/5d8c7814-5002-4a9b-b2ab-ad1f0552ee78/image.png)






