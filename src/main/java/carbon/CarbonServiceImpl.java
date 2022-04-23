package carbon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("carbonservice")
public class CarbonServiceImpl implements CarbonService{
	
	@Autowired
	@Qualifier("carbondao")
	CarbonDAO carbondao;

	@Override
	public int memberCount() {
		return carbondao.memberCount();
	}

	@Override
	public int partCount() {
		return carbondao.partCount();
	}

	@Override
	public List<Integer> carbonList() {
		
		List<Integer> list = carbondao.carbonList();
		
		return list;
	}

	@Override
	public Map<String, Object> allcarbon() {
		Map<String, Object> list = new HashMap<String, Object>();
		
		list.put("mc", carbondao.memberCount());
		list.put("pc", carbondao.partCount());
		list.put("cl", carbondao.carbonList());
		
		return null;
	}

	
}
