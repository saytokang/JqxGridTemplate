package x.y.z.service;

import java.util.List;
import java.util.Map;

public interface PostService {

	List<Map<String, Object>> getList(Map<String, String> params);

}
