<<<<<<< HEAD
package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ICommonCodeRepository;
import com.mycompany.webapp.dto.CommonDTO;

@Service
public class CommonCodeService implements ICommonCodeService{

	@Autowired
	ICommonCodeRepository CCR;
	
	
	@Override
	public List<CommonDTO> selectStateCode() {
		// TODO Auto-generated method stub
		return 	CCR.selectStateCode();

	}
<<<<<<< HEAD
=======

	
	
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
}
=======
package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ICommonCodeRepository;
import com.mycompany.webapp.dto.CommonDTO;

@Service
public class CommonCodeService implements ICommonCodeService{

	@Autowired
	ICommonCodeRepository CCR;
	
	
	@Override
	public List<CommonDTO> selectStateCode() {
		// TODO Auto-generated method stub
		return 	CCR.selectStateCode();

	}

	
	
}
>>>>>>> refs/remotes/origin/cbj2
