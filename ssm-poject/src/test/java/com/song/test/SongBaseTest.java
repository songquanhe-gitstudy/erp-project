package com.song.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 *author:song
 *date:2017年7月22日
**/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class SongBaseTest {
	
	@Test
	@Transactional   
	public void test() {
		
		System.out.println("-------------------");
	}

}
