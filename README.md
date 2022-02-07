# README

Sean Allen 유튜버님의 영상
https://youtu.be/FwGMU_Grnf8

SwiftUI MVVM Demo 프로젝트

## Overview

AppetizerListViewModel에서 네트워크 처리작업을 수행한다.
NetworkManager에서 @escaping(이스케이핑 클로저)을 사용하여 네트워크를 비동기적으로 처리한다.
Result타입과 JSON Decoder를 사용하여 구조체 모델(Codable)로 받아 에러처리(예외상황)와 JSON 파싱을 쉽게 처리한다.

Codable = Decodable & Encodable

초창기? Swift 네트워크 처리방식 (2018년쯔음까지 사용되던 방식) 
JSON Serialization
URLSessionDelegate

## Reference

이스케이핑 클로저
https://jusung.github.io/Escaping-Closure/

Rsult 타입
https://jusung.github.io/Result-타입/

JSON Parsing 비교
https://learn-hyeoni.tistory.com/45

