package cn.it.shop.service.Impl;



import java.math.BigDecimal;

import org.springframework.stereotype.Service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.ForderService;

@Service("forderService")
public class ForderServiceImpl extends BaseServiceImpl<Forder> implements ForderService{

	@Override
	public BigDecimal cluTotal(Forder forder) {
		BigDecimal total = new BigDecimal(0.00);
		for (Sorder sorder: forder.getSorderSet()) {
			total = total.add(sorder.getPrice().multiply(new BigDecimal(sorder.getNumber())));
		}
		return total;
	}

	@Override
	public void updateStatusByid(int id, int sid) {
		forderDao.updateStatusByid(id, sid);
	}
	
	
}
