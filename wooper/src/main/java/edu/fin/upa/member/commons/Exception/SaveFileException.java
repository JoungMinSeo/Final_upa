package edu.fin.upa.member.commons.Exception;

//사용자 정의 예외 : 자바에는 기본적으로 많은 예외 상황에 대한 Exception 클래스가 존재하지만
//구현되는 기능에 따라 Exception 클래스가 있음
//이럴 때 사용자가 직접 만들 수 있는 Exception 클래스이다
public class SaveFileException extends RuntimeException{

// RunTimeException 상송
// -> 해당 클래스는 반드시 예외처리를 하지 않아도 되는
// Unchecked Exception의 최상위 부모

public SaveFileException() {
super("업로드 된 파일을 저장하는 과정에서 문제 발생");
}

}