function fn() {    
var env = karate.env;  
karate.log('karate.env system property was:', env); 
if (!env) {    
env = 'dev'; 
// a custom 'intelligent' default   
}  var config = { 
// base config JSON     appId: '12344',     appSecret: '12345',     username:'xx.github.com',     
baseUrl:'https://gorest.co.in/',     
tokenID: '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',     
myVar: 'First Karate project' 
}   
if(env == 'qa') {
	
}
return config;  
 } 