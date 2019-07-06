
package com.rakib.sms.service;

import com.rakib.sms.model.Payment;
import org.springframework.stereotype.Service;

/**
 *
 * @author C7
 */
@Service
public interface PaymentService {

    public String insertMonthlypayment(Payment pay);

    public String updateMonthlypayment(int payid, Payment pay);

    public String deleteMonthlypayment(int payid);

    public String viewMonthlypayment();

    public Payment viewOneMonthlypayment(int payid);

}
