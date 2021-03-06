package com.kh.team.kdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.kdh.persistence.KdhFoodCartDao;

@Service
public class KdhFoodCartServiceImpl implements KdhFoodCartService {

	@Inject
	KdhFoodCartDao cartDao;
	
	@Override
	public List<KdhFoodCartDto> AllCart(String user_id) throws Exception {
		return cartDao.AllCart(user_id);
	}

	@Override
	public KdhFoodCartDto selectCart(String user_id, int food_num) throws Exception {
		return cartDao.selectCart(user_id, food_num);
	}

	@Override
	public void deleteCart(int food_cart_num) throws Exception {
		cartDao.deleteCart(food_cart_num);
	}

	@Override
	public void updateCart(int food_cart_num, int food_cart_count, int buy_food_price) throws Exception {
		cartDao.updateCart(food_cart_num, food_cart_count, buy_food_price);
	}

	@Override
	public void insertCart(KdhFoodCartDto cartDto) throws Exception {
		cartDao.insertCart(cartDto);
	}

	@Override
	public int overlapCart(String user_id, int food_num) throws Exception {
		return cartDao.overlapCart(user_id, food_num);
	}

	@Override
	public int selectFoodnumByCartnum(int food_cart_num) throws Exception {
		return cartDao.selectFoodnumByCartnum(food_cart_num);
	}

	@Override
	public int FoodTotalMoney(String user_id) throws Exception {
		return cartDao.FoodTotalMoney(user_id);
	}

	@Override
	public List<KdhBasicCartDto> selectCartListByUserId(String user_id, int food_num) throws Exception {
		return cartDao.selectCartListByUserId(user_id, food_num);
	}

	@Override
	public void deleteFoodCart(int food_num) throws Exception {
		cartDao.deleteFoodCart(food_num);
	}

	@Override
	public void deleteFoodCartAll(String user_id) throws Exception {
		cartDao.deleteFoodCartAll(user_id);
	}

	@Override
	public int selectCartCount(String user_id) throws Exception {
		return cartDao.selectCartCount(user_id);
	}

}
