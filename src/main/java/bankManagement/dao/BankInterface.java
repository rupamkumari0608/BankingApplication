package bankManagement.dao;

import bankMangement.bean.Account;

public interface BankInterface {
	Boolean createAccount(Account account);
	Boolean withdrawMoney(int id, double withdrawalAmount, double oldAmount);
	Boolean depositMoney(int id, double depositAmount, double oldAmount);
	}
