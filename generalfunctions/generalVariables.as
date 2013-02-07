// ActionScript file
var playerName:String="";
public var currentState:String;
public var currentMoney:int=4000; 
public var currentPoints:int=0;
public var currentPlayerNumber:int=0;
public var currentSpaceshipNumber:int=0;
public var currentHouseNumber:int=0;
public var currentPetNumber:int=0;
public var spaceShipLife:int=393;
public static const LIFEQUANT:int=5;

public static var arrayForLassoingGame:Array;//Array for lassoing game


public function getPlayerData(){
		var variables:URLVariables = new URLVariables();
		var varSend:URLRequest = new URLRequest("http://localhost:8080/theGame/getStuff.php");
		//varSend = new URLRequest("./getStuff.php"); //UNCOMMENT THIS FOR PUBLISHING
		var varLoader:URLLoader = new URLLoader();
		varSend.method = URLRequestMethod.POST;
		varSend.data = variables;
		varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
		variables.username=playerName;
		varLoader.addEventListener(Event.COMPLETE, getStuffCompleteHandler);
		variables.sendRequest = "whatever";	
		// Send the data to the php file
		varLoader.load(varSend);
	}

public function getStuffCompleteHandler(event:Event):void{
	var pointsG:String = event.target.data.points;
	var moneyG:String = event.target.data.money;
	var playerNumG:String = event.target.data.playerNumber;
	var spaceshipNumG:String = event.target.data.spaceshipNumber;
	var houseNumG:String = event.target.data.houseNumber;
	var petNumG:String = event.target.data.petNumber;
	currentPoints=int(pointsG);
	currentMoney=int(moneyG);
	currentPlayerNumber=int(playerNumG);
	currentSpaceshipNumber=int(spaceshipNumG);
	currentHouseNumber=int(houseNumG);
	currentPetNumber=int(petNumG);
	trace("pointsG is "+pointsG);
	trace("moneyG is "+moneyG);
	trace("playerNumG is "+playerNumG);
	trace("spaceshipNumG is "+spaceshipNumG);
	trace("houseNumG is "+houseNumG);
	trace("petNumG is "+petNumG);
}

public function setPlayerVariable(typeToEdit:String,valueToEnter:int):void{//all the values that we have are ints
	var variables:URLVariables = new URLVariables();
	var varSend:URLRequest = new URLRequest("http://localhost:8080/theGame/setStuff.php");
	//varSend = new URLRequest("./setStuff.php"); //UNCOMMENT THIS FOR PUBLISHING
	var varLoader:URLLoader = new URLLoader();
	varSend.method = URLRequestMethod.POST;
	varSend.data = variables;
	varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
	variables.username=playerName;
	variables.typeToEdit=typeToEdit;
	variables.valueToEnter=valueToEnter;
	varLoader.addEventListener(Event.COMPLETE, setStuffCompleteHandler);
	variables.sendRequest = "whatever";	
	// Send the data to the php file
	varLoader.load(varSend);
	}

public function setStuffCompleteHandler(event:Event):void{
	//getPlayerData();
	}