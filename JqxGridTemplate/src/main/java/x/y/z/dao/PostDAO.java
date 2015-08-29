package x.y.z.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Map<String, Object>> getList() {
		return sqlSession.selectList("sample.postList");
	}
	
}
