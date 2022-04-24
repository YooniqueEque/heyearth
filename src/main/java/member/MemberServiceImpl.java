package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberservice")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberdao;
	
	@Override
	public int joinmember(MemberDTO dto) {
		return memberdao.joinmember(dto);
	}

	@Override
	public int nicknameCheck(String id) {
		return memberdao.nicknameCheck(id);
	}

	@Override
	public MemberDTO loginmember(String id, String pw) {
		return memberdao.loginmember(id, pw);
	}

	@Override
	public MemberDTO memberView(String id) {
		return memberdao.memberView(id);
	}

	@Override
	public int updatemember(String id,String pw,String newpw,String newpwck,String phone) {
		return memberdao.updatemember(id,pw,newpw,newpwck,phone);
	}

	@Override
	public int pwck(String pw) {
		return memberdao.pwck(pw);
	}
	
	
}
