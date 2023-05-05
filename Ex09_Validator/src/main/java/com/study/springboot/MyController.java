package com.study.springboot;

import java.awt.List;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	@RequestMapping("/insertForm")
	public String insert1() {
		
//		List list = new ArrayList();
//		list.add(1);
//		list.add(2);
//				
//		return list;
//		
//		Map<K, V> map = new HashMap();
//		map.out("key", 123);
//		map.out("key2", "value");
//		
//		{
//			"key":"123",	
//			"value" :"day" 
//		}
		
		return "createPage";
		
	}
	
	@RequestMapping("/create")
    public String insert2(@ModelAttribute("dto")
    					   ContentDto contentDto,
    						
                          BindingResult result)
    {
        String page = "createDonePage";
        System.out.println(contentDto);
        
        ContentValidator validator = new ContentValidator();
        validator.validate(contentDto, result);
        if (result.hasErrors()) {
            page = "createPage";
        }
        
        return page;       
    }
}
