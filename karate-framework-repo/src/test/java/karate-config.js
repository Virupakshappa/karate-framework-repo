function fn() {    
var env = karate.env;  
karate.log('karate.env system property was:', env); 
if (!env) {    
env = 'dev'; 
// a custom 'intelligent' default   
}  var config = { 
// base config JSON     appId: '12344',     appSecret: '12345',     username:'xx.github.com',     
baseUrl:'https://gorest.co.in/',     
tokenID: 'e31d7ca4153ef9d12406f893af0d1dcd2e38fa53ae35edd9acb0f6cfd01ee910',     
myVar: 'First Karate project' 
}   
if(env == 'qa') {
	
}
return config;  
 } 