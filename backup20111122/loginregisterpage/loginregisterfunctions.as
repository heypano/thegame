public var loginRegisterContainer:Sprite;

public function initLoginRegister(){
	currentState="Login";
	hideStuff(); // this is where i hide everything
	loginRegisterContainer = new Sprite();
	loginSubmit.addEventListener(MouseEvent.CLICK, loginbtnDown);
	registerSubmit.addEventListener(MouseEvent.CLICK, registerbtnDown);
	/*To display the password field as Password*/
	loginPassword.displayAsPassword = true;
	registerPassword.displayAsPassword = true;
	/*To press Submit Using Enter*/
	loginUsername.addEventListener(KeyboardEvent.KEY_DOWN,loginPressSubmitUsingEnter);
	loginPassword.addEventListener(KeyboardEvent.KEY_DOWN,loginPressSubmitUsingEnter);
	registerUsername.addEventListener(KeyboardEvent.KEY_DOWN,registerPressSubmitUsingEnter);
	registerPassword.addEventListener(KeyboardEvent.KEY_DOWN,registerPressSubmitUsingEnter)
	/*To put everything in the container so it can be removed later*/
	fillLoginRegisterContainer();
	}


public function fillLoginRegisterContainer(){ // Adds all the elements to a container and the container to the stage
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

public function loginPressSubmitUsingEnter(event:KeyboardEvent):void{
	if(event.keyCode==Keyboard.ENTER){
		loginbtnDown(event as Event);
	}
}
public function registerPressSubmitUsingEnter(event:KeyboardEvent):void{
	if(event.keyCode==Keyboard.ENTER){
		registerbtnDown(event as Event);
	}
}

// Btn Down function
public function loginbtnDown(event:Event):void {
	var variables:URLVariables = new URLVariables();
	var varSend:URLRequest = new URLRequest("http://localhost:8080/theGame/login.php");
	varSend = new URLRequest("./login.php"); //UNCOMMENT THIS FOR PUBLISHING
	var varLoader:URLLoader = new URLLoader();
	varSend.method = URLRequestMethod.POST;
	varSend.data = variables;
	varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
	varLoader.addEventListener(Event.COMPLETE, loginCompleteHandler);
	
	variables.username = loginUsername.text;
	variables.password = loginPassword.text;
	variables.sendRequest = "parse";	
	// Send the data to the php file
	varLoader.load(varSend);
}
// When the data comes back from PHP we display it here		
public function loginCompleteHandler(event:Event):void{
	var phpVar1:Boolean = Boolean(int(event.target.data.var1));
	//var phpVar2:Boolean = Boolean(int(event.target.data.var2));
	//result1_txt.text = phpVar1.toString();
	//result2_txt.text = phpVar2.toString();
	if(phpVar1){
		hideAndRemove(loginRegisterContainer);
		initMap();//go to the map
	}
	else result1_txt.text = "Wrong Username and/or Password";
}

public function registerbtnDown(event:Event):void {
	var variables:URLVariables = new URLVariables();
	var varSend:URLRequest = new URLRequest("http://localhost:8080/theGame/register.php");
	varSend = new URLRequest("./register.php"); //UNCOMMENT THIS FOR PUBLISHING
	var varLoader:URLLoader = new URLLoader();
	varSend.method = URLRequestMethod.POST;
	varSend.data = variables;
	varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
	varLoader.addEventListener(Event.COMPLETE, registerCompleteHandler);
	variables.username = registerUsername.text;
	variables.password = registerPassword.text;
	variables.sendRequest = "parse";	
	// Send the data to the php file
	varLoader.load(varSend);
}

public function registerCompleteHandler(event:Event):void{
	var phpVar1:Boolean = Boolean(int(event.target.data.var1));
	var message:String;
	if(phpVar1){
		message="Registration was successful.";	
		hideAndRemove(loginRegisterContainer);
		initMap();//go to the map
	}
	else message="I'm sorry! Another player is using the name \""+registerUsername.text+"\". Why don't you try a different name?";
	result1_txt.text=message;

	
	//var phpVar2:Boolean = Boolean(int(event.target.data.var2));
	//result1_txt.text = phpVar1.toString();
	//result2_txt.text = phpVar2.toString();
	//if(phpVar1)hideAndRemove(loginRegisterContainer);
}