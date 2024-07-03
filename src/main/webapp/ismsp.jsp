<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ismspdto.resultdto"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./icon/fa2.ico" type="image/gif" sizes="16x16">
    <title>Dashboard</title>
    <meta name="og:description"
        content="Unveiling the DataMents Free Bootstrap Admin Dashboard Template, your ultimate solution to a seamless web management experience! This is more than just a template; it's your partner in crafting a digital masterpiece.">
    <meta name="robots" content="index, follow">
    <meta name="og:title" property="og:title" content="DataMents - Free Bootstrap Admin Dashboard Template">
    <meta property="og:image"
        content="https://www.designtocodes.com/wp-content/uploads/2023/08/DataMents-Free-Bootstrap-Admin-Dashboard-Template.jpg">
    <!-- bootstrap css link -->
    <link rel="stylesheet" href="./lib/bootstrap_5/bootstrap.min.css">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="./lib/fontawesome/css/all.min.css">
    <!-- main css -->
    <link rel="stylesheet" href="./assets/css/global.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <!-- responsive css -->
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

    <div class="d2c_wrapper">
        <div class="d2c_sidebar d2c_home rounded-4 px-4 py-4 py-md-4 m-4 me-0" id="sidebar">
            <div class="d-flex flex-column h-100">
                <a href="./index.jsp" class="mb-0 brand-icon">
                    <img class="navbar-brand" src="./assets/images/logo/logo.png" alt="logo">
                </a>
                <hr class="divider">
                <ul class="navbar-nav flex-grow-1" id="d2c_Sidebar">
                    <li class="nav-item">
                        <a class="nav-link active" href="./index.jsp">
                            <i class="fas fa-home me-2" style="color: #ffffff"></i>
                            <span style="color: #ffffff;">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <!--파일 이름 확인-->
                            <i class="fas fa-list me-2"></i>
                            <span>인증 과정 설명</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="docmanage">
                            <i class="fa-solid fa-lock" style="color: #ffffff;"></i>
                            <span>증적 관리</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="docdownload"> <!--파일 이름 확인-->
                            <i class="fa-solid fa-file-arrow-down" style="color: #ffffff;"></i> 
                            <span>인증 심사 서류 양식</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="ismsp-link" href="#">
                            <i class="fa-solid fa-list-check" style="color: #ffffff;"></i> <span>ISMS-P 심사</span>
                        </a>
                        <ul class="navbar-nav flex-column ms-3 d-none" id="ismsp-submenu">
                            <li class="nav-item">
                                <a class="nav-link" id="sub2-link" href="#">
                                    <i class="fa-solid fa-1" style="color: #ffffff;"></i>
                                    <span>관리체계 수립 및 운영</span>
                                </a>
                                <ul class="navbar-nav flex-column ms-3 d-none" id="sub2-submenu">
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub2-1-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>1.1. 관리체계 기반 마련</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub2-1-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="ismsp?category=1.1.2 최고책임자의 지정">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.1.2 최고책임자의 지정</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="ismsp?category=1.1.3 조직 구성">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.1.3 조직 구성</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="ismsp?category=1.1.4 범위 설정">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.1.4 범위 설정</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="ismsp?category=1.1.5 정책 수립">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.1.5 정책 수립</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="ismsp?category=1.1.6 자원 할당">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.1.6 자원 할당</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub2-2-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>1.2. 위험 관리</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub2-2-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.2.1 정보자산 식별</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.2.2 현황 및 흐름분석</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.2.3 위험 평가</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub2-3-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>1.3. 관리체계 운영</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub2-3-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.3.1 보호대책 구현</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.3.2 보호대책 공유</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.3.3 운영현황 관리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub2-4-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>1.4. 관리체계 점검 및 개선</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub2-4-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.4.1 법적 요구사항 준수 검토</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.4.2 관리체계 점검</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>1.4.3 관리체계 개선</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="sub4-link" href="#">
                                    <i class="fa-solid fa-2" style="color: #ffffff;"></i>
                                    <span>보호대책 요구사항</span>
                                </a>
                                <ul class="navbar-nav flex-column ms-3 d-none" id="sub4-submenu">
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub4-1-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>2.1. ㅋㅋㅋㅋㅋㅋ</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub4-1-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 1</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 2</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 3</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 4</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub4-2-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>2.2.ㅋㅋㅋㅋㅋ</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub4-2-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 1</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 2</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 3</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 4</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub4-3-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>2.3. ㅋㅋㅋㅋㅋ</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub4-3-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 1</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 2</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 3</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 4</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub4-4-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>2.4.ㅋㅋㅋㅋㅋㅋ</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub4-4-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 1</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 2</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 3</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>세부세부 카테고리 4</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="sub3-link" href="#">
                                    <i class="fa-solid fa-3" style="color: #ffffff;"></i>
                                    <span>개인정보 처리 단계별 요구사항</span>
                                </a>
                                <ul class="navbar-nav flex-column ms-3 d-none" id="sub3-submenu">
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub3-1-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>3.1. 개인정보 수집 시 보호조치</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub3-1-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.1 개인정보 수집·이용</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.2 개인정보 수집 제한</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.3 주민등록번호 처리 제한</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.4 민감정보 및 고유식별정보의 처리 제한</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.5 개인정보 간접수집</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.6 영상정보처리기기 설치·운영</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.1.7 마케팅 목적의 개인정보 수집·이용</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub3-2-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>3.2. 개인정보 보유 및 이용 시 보호조치</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub3-2-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.2.1 개인정보 현황관리</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.2.2 개인정보 품질보장</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.2.3 이용자 단말기 접근 보호</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.2.4 개인정보 목적 외 이용 및 제공</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.2.5 가명정보 처리</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub3-3-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>3.3. 개인정보 제공 시 보호조치</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub3-3-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.3.1 개인정보 제3자 제공</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.3.2 개인정보 처리 업무 위탁</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.3.3 영업의 양도 등에 따른 개인정보 이전</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.3.4 개인정보 국외이전</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub3-4-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>3.4. 개인정보 파기 시 보호조치</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub3-4-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.4.1 개인정보 파기</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.4.2 처리목적 달성 후 보유 시 조치</span>
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sub3-4-link" href="#">
                                            <i class="fa-solid fa-circle-dot" style="color: #ffffff;"></i>
                                            <span>3.5. 정보주체 권리보호</span>
                                        </a>
                                        <ul class="navbar-nav flex-column ms-3 d-none" id="sub3-4-submenu">
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.5.1 개인정보 처리방침 공개</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.5.2 정보주체 권리보장</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="fa-solid fa-caret-right" style="color: #ffffff;"></i>
                                                    <span>3.5.3 정보주체에 대한 통지</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </li>
                  </ul>
            </div>
        </div>
        <!-- Page Content  -->
        <div class="d2c_main px-lg-4 px-md-4 px-3">
            <!-- Main Content -->
            <div class="body">
			<br>
                <!-- Table 1 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card ml-4">
                            <div class="card-header">
                                <h4 class="mb-0 text-capitalize">ISMS-P 심사</h4>
                            </div>
                            <%
                            String category = (String)request.getAttribute("category");
                            %>
                            <div class="card-body">
	                            <p><%=category %></p>
								<br><br>
				        		<form method="post" action="ismsp" enctype="multipart/form-data" data-category=${category}>
									<div class="row">
										<div class="col-9">
											<div class="input-group mb-3">
								  				<input type="file" class="form-control" name="filename1" id="inputGroupFile01" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
											</div>
											<div class="input-group mb-3">
								  				<input type="file" class="form-control" name="filename2" id="inputGroupFile02" aria-describedby="inputGroupFileAddon03" aria-label="Upload">
											</div>
										</div>
										<div class="col-3">
											<button type="submit" class="btn btn-primary" style="height:100%; display: flex; align-items: center; justify-content: center;">심사하기</button>
										</div>
									</div>
								</form>
	                            <div class="live-upt2us">
		                            <%
		                            resultdto result = (resultdto)request.getAttribute("result");
		                            %>
			                        <table class="table">
			                            <thead>
			                                <tr>
			                                    <th scope="col">번호</th>
			                                    <th scope="col">파일명</th>
			                                    <th scope="col">ISMS-P 준수 여부</th>
			                                    <th scope="col">담당자명</th>
			                                    <th scope="col">상세내용 보기</th>
			                                </tr>
			                            </thead>
			                            <tbody>
			                            <%
			                            if(result==null || result.getFilename()==null){
			                            %>
			                            <tr></tr>
			                            <%
			                            } else {
			                            	String[] filenames = new String[1];
			                            	if(result.getFilename().contains(",")){
			                            		filenames = result.getFilename().split(",");
			                            	}
			                            	else{
			                            		filenames[0] = result.getFilename();
			                            	}
			                            	
			                            	for(int i=1;i<=filenames.length;i++){
			                            %>
			                                <tr>
			                                    <td scope="row"><%=i %></td>
			                                    <td><%=filenames[i-1] %></td>
			                                    <td><%=result.getResult() %></td>
			                                    <td>박정환</td>
			                                    <td>다운로드</td>
			                                </tr>
			                            <%
			                            	}
			                            }
			                            %>
			                            </tbody>
			                        </table>
			                    </div>
			                </div>
                        </div>
                    </div>
                </div>
                <!-- Table 1 -->
                <%
                String[] resultDescription = null;
                if(result!=null && result.getDescription()!=null)
                	resultDescription = result.getDescription().split("nn");
                %>
                <div class="col-md-8 col-xl-12" style="height: 25vh;">
    				<div class="card" style="height: 100%;">
        				<div class="card-body" style="height: 100%;">
            				<div class="d-flex align-items-center justify-content-between mb-2">

            				</div>
	            			<h6 class="mb-1">인증 심사 결과</h6>
	            			<%
	            			if(resultDescription!=null){
	            				resultDescription[1] = resultDescription[1].replace("n", "\n");
	            				resultDescription[1] = resultDescription[1].replace("[적합 여부]", "");
	            			%>
	            			<h5 class="mb-1 fw-bold text-dark"><%=resultDescription[1] %></h5>
	            			<%
	            			} else {
	            			
	            			%>
		            		<h5 class="mb-1 fw-bold text-dark"></h5>
		            		<%
	            			}
		            		%>
	            			<p class="small text-muted mb-0"></p>
        				</div>
    				</div>
				</div>
				<br>
				<div class="col-md-8 col-xl-12" style="height: 25vh;">
			   		<div class="card" style="height: 100%;">
			        	<div class="card-body" style="height: 100%;">
			            	<div class="d-flex align-items-center justify-content-between mb-2">
			
						    </div>
			            	<h6 class="mb-1">조치 방안</h6>
	            			<%
	            			if(resultDescription!=null){
	            				resultDescription[2] = resultDescription[2].replace("[해결책]", "");
	            				String[] sens = resultDescription[2].split("n");
	            				for(int i=0;i<sens.length;i++){
	            				//resultDescription[2] = resultDescription[2].replace("n", "\n");
	            			%>
			            	<h5 class="mb-1 fw-bold text-dark"><%=sens[i] %></h5>
			            	<%
	            				}
	            			} else {
			            	%>
			            	<h5 class="mb-1 fw-bold text-dark"></h5>
			            	<%
	            			}
			            	%>
			            	<p class="small text-muted mb-0"></p>
			        	</div>
			    	</div>
				</div>
			</div><!-- Page Content  -->
    	</div>
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
		    <!-- Initial  Javascript -->
		    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		    <script src="./lib/bootstrap_5/bootstrap.bundle.min.js"></script>
		
		    <!-- datatable js link -->
		    <script src="./lib/DataTables/datatables.min.js"></script>
		    <script src="./lib/DataTables/dataTables.buttons.min.js"></script>
		    <script src="./lib/DataTables/jszip.min.js"></script>
		    <script src="./lib/DataTables/pdfmake.min.js"></script>
		    <script src="./lib/DataTables/vfs_fonts.js"></script>
		    <script src="./lib/DataTables/buttons.html5.min.js"></script>
		    <script src="./lib/DataTables/buttons.print.min.js"></script>
		    <script src="./lib/DataTables/colVis.min.js"></script>
		
		    <!-- custom js -->
		    <script src="./assets/js/main.js"></script>
		<script>
                document.getElementById('ismsp-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const submenu = document.getElementById('ismsp-submenu');
                    submenu.classList.toggle('d-none');
                });

                document.getElementById('sub2-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub2submenu = document.getElementById('sub2-submenu');
                    sub2submenu.classList.toggle('d-none');
                });

                document.getElementById('sub2-1-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub2_1_submenu = document.getElementById('sub2-1-submenu');
                    sub2_1_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub2-2-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub2_2_submenu = document.getElementById('sub2-2-submenu');
                    sub2_2_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub2-3-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub2_3_submenu = document.getElementById('sub2-3-submenu');
                    sub2_3_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub2-4-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub2_4_submenu = document.getElementById('sub2-4-submenu');
                    sub2_4_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub4-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub4submenu = document.getElementById('sub4-submenu');
                    sub4submenu.classList.toggle('d-none');
                });

                document.getElementById('sub4-1-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub4_1_submenu = document.getElementById('sub4-1-submenu');
                    sub4_1_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub4-2-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub4_2_submenu = document.getElementById('sub4-2-submenu');
                    sub4_2_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub4-3-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub4_3_submenu = document.getElementById('sub4-3-submenu');
                    sub4_3_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub4-4-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub4_4_submenu = document.getElementById('sub4-4-submenu');
                    sub4_4_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub3-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub3submenu = document.getElementById('sub3-submenu');
                    sub3submenu.classList.toggle('d-none');
                });

                document.getElementById('sub3-1-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub3_1_submenu = document.getElementById('sub3-1-submenu');
                    sub3_1_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub3-2-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub3_2_submenu = document.getElementById('sub3-2-submenu');
                    sub3_2_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub3-3-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub3_3_submenu = document.getElementById('sub3-3-submenu');
                    sub3_3_submenu.classList.toggle('d-none');
                });

                document.getElementById('sub3-4-link').addEventListener('click', function (event) {
                    event.preventDefault();
                    const sub3_4_submenu = document.getElementById('sub3-4-submenu');
                    sub3_4_submenu.classList.toggle('d-none');
                });
            </script>
		    <script>
		        $(document).ready(function () {
		            $('#table_id_1').DataTable();
		
		            $('#table_id_2').DataTable({
		                dom: "<'row align-items-center'<'col-sm-12 col-md-6 px-3 text-center text-md-start'B><'col-sm-12 col-md-6 px-3'f>>" +
		                    "<'row'<'col-sm-12'tr>>" +
		                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		                buttons: [
		                    { extend: 'copy', className: 'btn btn-primary' },
		                    { extend: 'csv', className: 'btn btn-secondary' },
		                    { extend: 'excel', className: 'btn btn-success' },
		                    { extend: 'pdf', className: 'btn btn-warning' },
		                    { extend: 'print', className: 'btn btn-danger' }
		                ]
		            });
		
		            var table_3 = $('#table_id_3').DataTable( {
		                dom: "<'row align-items-center'<'col-sm-12 col-md-6 px-3 text-center text-md-start'B><'col-sm-12 col-md-6 px-3'f>>" +
		                    "<'row'<'col-sm-12'tr>>" +
		                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		                lengthChange: false,
		                buttons: [
		                    { 
		                        extend: 'colvis', 
		                        className: 'btn btn-warning',
		                    }
		                ]
		            } );
		        
		            table_3.buttons().container().appendTo( '#table_id_3_wrapper .col-md-6:eq(0)');
		        });
		
		    </script>
		    
	    <script>

        function addURLParamsToForm() {
            const urlParams = new URLSearchParams(window.location.search);
            const form = document.querySelector("form[method='post']");

            urlParams.forEach((value, key) => {
                const input = document.createElement("input");
                input.type = "hidden";
                input.name = key;
                input.value = value;
                form.appendChild(input);
            });
        }

        window.onload = addURLParamsToForm;
	    </script>
		</div>
	</body>
</html>