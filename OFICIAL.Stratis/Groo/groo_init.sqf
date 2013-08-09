// VARIABLES
// Server Console Messages
groo_console_enabled = true;

// FUNCTIONS

// Console Functions
call compile preprocessFileLineNumbers "groo\functions\consoleFunctions.sqf";


// BRIEFING
player createDiaryRecord ["Diary", 		["Equipamento", 
										"Os equipamentos Padrão não se encontram na caixa de Munições do MILSIM."+
										"Utilize a opção de cor azul MILSIM LoadOut Menu que está disponível a 20"+
										"metros da caixa. Equipamentos e Munição adicional se encontram na caixa do"+
										"MILSIM e rádios na caixa ao lado. Siga as orientações dos seus superiores e"+
										"evitem aglomeração."]
										];

player createDiaryRecord ["Diary", 		["Revive", 
										"O combatente atingido tem a chance de sobreviver por 6 minutos até receber"+
										"tratamento médico. O número de vezes que o combatente pode ser atingido"+
										"e voltar ao combate após atendimento é 3. Quando não houver mais condições"+
										"de ser tratado o combatente morrerá não podendo retornar a operação."+
										"Combatentes feridos são identificados por 1 simbolo vermelho a partir de"+
										"30 metros de distância."]
										];										
player createDiaryRecord ["Diary",										
										["Grupos", 
										"A qualquer momento utilize a ação rose Group Menu para ingressar em"+
										"um grupo diferente, deixar o seu grupo atual ou assumir a liderança do"+
										"seu grupo atual. Para ingressar em um grupo você deve estar a menos de"+
										"4 metros de um membro vivo. Utilize essa função apenas com orientação do"+
										"seu superior, sendo passível de punição o uso indevido"]
										];
										
player createDiaryRecord ["Diary",										
										["Créditos", 
										"Missão de Template do Virtual MILSIM Brasil<br/>"+
										"Equipe:<br/>"+
										"Col.Viper<br/>"+
										"Cpl.Andrade<br/>"+
										"Cpl.Cpl.OfKings<br/>"+
										"Cpl.IronPack<br/>"+
										"<br/><br/>"]
										];										