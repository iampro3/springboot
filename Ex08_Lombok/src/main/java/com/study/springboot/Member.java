package com.study.springboot;

import java.util.Objects;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@Data //  lombok 설정됨	: 하기 @Getter~@EqualsAndHashCode 까지를 통합해서 불러온다.
@Getter 	//  lombok 설정됨
@Setter		//  lombok 설정됨
@ToString   //  lombok 설정됨
@RequiredArgsConstructor	// 생성자
@EqualsAndHashCode	// 어떻게 객체가 같은지 아는가? 번지수를 알면 찾을 수있다.
					// hashcode + equals 를 동시생성한다.
*/
public class Member {
	private String id;
	private String name;
	private int age;
	
//	@Override
//	public String toString() {
//		
//	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		return age == other.age && Objects.equals(id, other.id) && Objects.equals(name, other.name);
	}

	@Override
	public int hashCode() {
		return Objects.hash(age, id, name);
	}
	
}
