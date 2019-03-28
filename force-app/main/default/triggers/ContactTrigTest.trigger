trigger ContactTrigTest on Contact (before insert) {
	insurancetest	insr = new insurancetest();
    decimal	basl = insurancetest.smokercharge;
}