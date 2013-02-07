import flash.display.Sprite;

// ActionScript file

public var loginRegisterContainer:Sprite;
public var mapContainer:Sprite;
public var lassoContainer:Sprite;
public var spacePortContainer:Sprite;
public var dressUpSpaceshipContainer:Sprite;
public var screenAfterRegisterContainer:Sprite;
public var screenAfterRegisterContainer2:Sprite;

//Putting stuff in containers
public function startGameContainerWise():void{
	fillLoginRegisterContainer();
	fillMapContainer();
	fillScreenAfterRegisterContainer();
	fillScreenAfterRegisterContainer2();
	fillLassoContainer();
	fillspacePortContainer();
	filldressUpSpaceshipContainer();
	mapContainer.visible=false;
	lassoContainer.visible=false;
	spacePortContainer.visible=false;
	dressUpSpaceshipContainer.visible=false;
	screenAfterRegisterContainer.visible=false;
	screenAfterRegisterContainer2.visible=false;
	arrayForLassoingGame = new Array(spaceShip.bound,lassoPointsLabel,lassoPoints,moneylassoing,moneylabellassoing,lifebar,lassoBack);
}


public function fillLoginRegisterContainer():void{
	loginRegisterContainer = new Sprite();
	loginRegisterContainer.addChild(loginBack);
	loginRegisterContainer.addChild(loginUsernameLabel);
	loginRegisterContainer.addChild(loginPasswordLabel);
	loginRegisterContainer.addChild(loginLabel);
	loginRegisterContainer.addChild(loginUsername);
	loginRegisterContainer.addChild(loginPassword);
	loginRegisterContainer.addChild(loginSubmit);
	loginRegisterContainer.addChild(registerUsernameLabel);
	loginRegisterContainer.addChild(registerPasswordLabel);
	loginRegisterContainer.addChild(registerLabel);
	loginRegisterContainer.addChild(registerUsername);
	loginRegisterContainer.addChild(registerPassword);
	loginRegisterContainer.addChild(registerSubmit);
	loginRegisterContainer.addChild(result1_txt);
	loginRegisterContainer.addChild(result2_txt);
	loginRegisterContainer.addChild(theTitle);
	this.addChild(loginRegisterContainer);
	}

public function fillScreenAfterRegisterContainer():void{
	screenAfterRegisterContainer=new Sprite();
	screenAfterRegisterContainer.addChild(registerHeyText);
	screenAfterRegisterContainer.addChild(screenAfterRegisterForwardBTN);
	this.addChild(screenAfterRegisterContainer);
}
public function fillScreenAfterRegisterContainer2():void{
	screenAfterRegisterContainer2=new Sprite();
	screenAfterRegisterContainer2.addChild(screenAfterRegisterContainer2hey);
	screenAfterRegisterContainer2.addChild(screenAfterRegisterForwardBTN2);
	screenAfterRegisterContainer2.addChild(screenAfterRegister2instr);
	screenAfterRegisterContainer2.addChild(keypad);
	screenAfterRegisterContainer2.addChild(spaceBar);
	this.addChild(screenAfterRegisterContainer2);
}

public function fillMapContainer():void{
	mapContainer = new Sprite();
	mapContainer.addChild(theLassoPlanet);
	mapContainer.addChild(theSpacePort);
	mapContainer.addChild(thesun);
	mapContainer.addChild(mapBorder);
	mapContainer.addChild(alertForEvilDude);
	alertForEvilDude.visible=false;
	this.addChild(mapContainer);
	}

public function fillLassoContainer():void{
	lassoContainer = new Sprite();
	lassoContainer.addChild(lassoBack);
	lassoContainer.addChild(deb1test);
	lassoContainer.addChild(deb2test);
	lassoContainer.addChild(deb3test);
	lassoContainer.addChild(deb4test);
	lassoContainer.addChild(lassoBack);
	lassoContainer.addChild(lassoPointsLabel);
	lassoContainer.addChild(lassoPoints);
	lassoContainer.addChild(moneylabellassoing);
	lassoContainer.addChild(moneylassoing);
	lassoContainer.addChild(lifebar);
	this.addChild(lassoContainer);
}

public function fillspacePortContainer():void{
	spacePortContainer = new Sprite();
	spacePortContainer.addChild(dressSpaceshipButton);
	spacePortContainer.addChild(spacePortBack);
	this.addChild(spacePortContainer);
}

public function filldressUpSpaceshipContainer():void{
	dressUpSpaceshipContainer = new Sprite();
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade1);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade2);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade3);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade4);
	dressUpSpaceshipContainer.addChild(spaceShipUpgrade5);
	dressUpSpaceshipContainer.addChild(money);
	dressUpSpaceshipContainer.addChild(moneylabel);
	dressUpSpaceshipContainer.addChild(dressupBack);
	this.addChild(dressUpSpaceshipContainer);
}



