package x.y.z.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import x.y.z.dao.PostDAO;

@Service("postService")
public class PostServiceImpl implements PostService {

	@Autowired
	PostDAO postDAO;
	
	@Override
	public List<Map<String, Object>> getList(Map<String, String> params) {
		
		return postDAO.getList(params);
	}

}
