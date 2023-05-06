VAR filmBuff = 3
VAR avantGarde = 3
VAR italian = 3
VAR handstand = 3
VAR wacy = 3

VAR points = 3

VAR crown = false
VAR complain = false
VAR firstHandstand = false
VAR bumpManuel = false
VAR sawGodfather = false
VAR isCop = false
VAR gaveCrown = false

-> title

=== title ===
THE WACY

A story of strife, love, and loss 

by Andrew Wei and ttvTonikSC
    * [Start] ->intro


=== intro ===
- A man enters a dream where he sees nothing but small birds in a void. Are they his inner thoughts? His demons? He sets off to talk to them to find out.
    * [Continue] -> a
=a
- But first, he must assign his stats to determine how his adventure will play out.
    * [Continue] -> b
=b
{points <= 0: ->act1}
- You have {points} Stat points to allocate.
    + [+Film Buff: {filmBuff}]
        ~filmBuff += 1
        ~points -= 1
        ->b
    + [+Avant Garde: {avantGarde}]
        ~avantGarde += 1
        ~points -= 1
        ->b
    + [+Italian: {italian}]
        ~italian += 1
        ~points -= 1
        ->b
    + [+Handstand: {handstand}]
        ~handstand += 1
        ~points -= 1
        ->b
    + [+Wacy: {wacy}]
        ~wacy += 1
        ~points -= 1
        ->b
-> act1
=== act1 ===
- Act 1, O brother wherefore art thou
    * [Continue] -> tito
=== tito ===
- Tito: Hey man. We’ve noticed your wacy levels have been dropping dangerously low. So theres this quest right. This asshole pesto definitely stole the seed of wacy. 
    * [Continue] 
- Tito: Thats where it all comes from man. Your creative conscious, the abstract that only you can understand. And its gone. So listen here, we gotta go get that seed of wacy from pesto’s tower. Its not that far, it should be just up ahead
    * [Take the Quest]
        Tito: alright sick. My friend up there will guide you to the next uhhh location
        {checkStat("Wacy", wacy, 1)}
        ** [Continue] -> meetLinManuel
    * [Complain]
        ~ complain = true
        Tito: dude cmon. Itll be fun i promise. We spent like 5 hours writing this quest for you
        {checkStat("Wacy", wacy, -2)}
        ** [Continue] -> meetLinManuel
    * [Do a handstand]
        ~ firstHandstand = true
        Tito: hey that was pretty cool man. Alright lets go.
        {checkStat("Wacy", wacy, 2)}
        ** [Continue] -> meetLinManuel
-> meetLinManuel
        
=== meetLinManuel ===
- Tito leads you down a path leading to god knows where. Along the way, you meet a strange light blue dude with a glock.
    * [Continue] -> linManuel
    
=== linManuel ===
- Lin Manuel: Hello my friend. My name is Lin-Manuel. Bit of a critic of the film variety. Are you familiar with Shark Tale?
    -> askManuel
== askManuel ===
    * [What's up with the gun]
        -- Lin Manuel: I believe in the right to bear arms.
            ** [Do you have any education on gun training]
                --- Lin Manuel: No. 
                    *** [ok]
                        ---- Lin Manuel: Ignore the gun. Have you seen Shark Tale?
                        -> askManuel
    
    * [{filmBuff >= 4:
        Yea thats the one with Will Smith right
    - else:
        No I actually haven't
    }]
        {filmBuff >= 4:
            Lin Manuel: Yeah, tis’ one of my favorite films. I have yet to see any others yet, but I have heard great things about Over the Hedge.
                ** [cool]
                    Lin Manuel: what other films have you seen ->filmTalk
                
        -else:
            Lin Manuel: Erm you should check it out pronto my frienderino. Have you seen any films then?? ->filmTalk
        }

    *-> afterManuel
        
        = filmTalk
            
            ** [The Godfather is pretty good]
                --- Lin Manuel: I have no idea what that is.
                {checkStat("Italian", italian, 5)}
                {checkStat("Film Buff", filmBuff, 2)}
                    *** [continue] -> askManuel
            ** [I’m really into Wes Anderson]
                --- Lin Manuel: Pretentious prick.
                {checkStat("Italian", italian, -3)}
                {checkStat("Avant Garde", avantGarde, 3)}
                {checkStat("Film Buff", filmBuff, 2)}
                    *** [:(] -> askManuel
            ** [I enjoyed Goodfellas quite a bit]
                {checkStat("Italian", italian, 4)}
                {checkStat("Film Buff", filmBuff, 1)}
                --- Lin Manuel: Is that one a sequel or prequel to Shark Tale
                    *** [Don't answer] 
                    ---- Lin Manuel: ...ok
                        **** [continue] -> askManuel

=== afterManuel ===
- Lin Manuel: Well anyways, I should probably tell you a bit about the area ahead. You are now headed to the outskirts of The Wacy. You should be careful out there, my old chap. It’s not actually that dangerous, but the guys out there are weird. 
*[Continue] ->hatTip
= hatTip
- Lin-Manuel tips his hat at you
    * {handstand >= 4} [Do a handstand]
        -- Lin Manuel: woah. 
        {checkStat("Handstand", handstand, 2)}
        **[Continue] ->act2
    * [Give him another fist bump]
        ~bumpManuel = true
        -- Lin Manuel: Cya.
        {checkStat("Avant Garde", avantGarde, -1)}
        {checkStat("Wacy", wacy, 2)}
        **[Continue] ->act2
    * [move on] ->act2
    

=== act2 ===
- Act 2: Turning Over a New Leaf 
    *[continue]->a
=a
- You walk further into the Wacy. You hear a loud bass in the background and the many Pyoro of the lands saying strange things. It's a little creepy so you keep going
    *[Continue]->b
=b
- You meet a pretty snazzy dude with headphones on. He sees you and approaches you.
    *[Continue]->c
=c
- Pranzo: COME STAI, VA BENE? BUONGIORNO IL MIO AMICO! ->pranzo

=== pranzo ===
* [{italian < 5:
    sorry what
- else:
    VA BENE VA BENE E TU?
}]
    POTRESTI NON SENTIRMI?
    {italian < 5:
        ** [no I can't]
            Pranzo: CAPISCO… ->afterPranzo
        ** [si senor]
            Pranzo: :/
            {checkStat("Italian", italian, -10)}
            {checkStat("Wacy", wacy, 2)}
            {checkStat("Avant Garde", avantGarde, 3)}
            ->afterPranzo
        ** [I mean I watched The Godfather]
            ~sawGodfather = true
            Pranzo: abbastanza vicino la mia giovane polpetta 
            {checkStat("Italian", italian, 2)}
            {checkStat("Avant Garde", avantGarde, 2)}
            ->afterPranzo
    - else:
        Pranzo: AH MOLTO BENE MOLTO BENE HAI BISOGNO DI INDICAZIONI?
        {checkStat("Wacy", wacy, 3)}
        {checkStat("Handstand", handstand, 2)}
            ** [I could use some directions thank you] ->afterPranzo
            ** [sì, sto cercando di raggiungere il seme di Wacy]
                ~crown = true
                Pranzo: Capisco. Possiedi chiaramente il potenziale di un vero wacifier italiano. Ecco una corona per commemorare. ->afterPranzo


    }
* [cosi cosi]
    -- Pranzo: VEDO VEDO BENE SPERO CHE TU ABBIA UNA SPLENDIDA GIORNATA!
        ** [Hey I was kinda just spitballing there - I dont actually know Italian]
            --- Pranzo: …你是警察吗?
                *** [yes]
                    ~isCop = true
                    --- Pranzo: guardati le spalle ragazzo [continue]->afterPranzo
                *** [no] ->afterPranzo
*->afterPranzo

=== afterPranzo ===
    * [Continue]->a
=a
- Pranzo: più avanti c'è uno wacy uccellino che ti guiderà alla posizione successiva
    * {italian>=1} [Grazie]
        -- Pranzo: Yeah no problem man
            **[continue] ->beforeBrady
    * [Thank you]
        -- Pranzo: Buona fortuna là fuori, strani piccoli arancini!
        {checkStat("Italian", italian, -1)}
            **[continue] ->beforeBrady
    * {handstand>=6} [Do a handstand]
        -- Pranzo: Fa fresco!
        {checkStat("Wacy", wacy, 2)}
            **[continue] ->beforeBrady


=== beforeBrady ===
- You bid adeu to the strange italian man and see a bowling pin. Oh wait that's another pyoro 
    *[Continue]->a
=a
- King Brady: Hey buddy. I’m King Brady, nice to meet ya. I see you met my brother back there. Nice guy, huh? Anyways, what can I do ya for? ->brady
    
=== brady ===
* [If you're a king, where's your crown?]
    -- King Brady: I don’t personally subscribe to the monarchy my dude
    ** {crown} [Would you mind if i gave you this crown at least?]
        ~gaveCrown = true
        ~crown=false
        --- King Brady: hey man I appreciate that :) ->brady
    ** [I feel that. I hate authority]
        --- King Brady: for sure man
        {checkStat("Handstand", handstand, 2)}->brady
* [I’m looking for the way to the Seed of Wacy. Can you help me find it?]
    - King Brady: yeah man. I saw pesto run into his tower with it like an hour and a half ago. He’s like right over there
        ** [Awesome, thanks King Brady!]
            -- King Brady: of course dude. Have a good one. 
                ***[continue]->act3
                
=== act3 ===
- Act 3: Live and Let Die
    *[continue] ->a
=a
- You walk into the tower King Brady pointed you towards. You're greeted with the sight of a spacious interior with tall pillars around you, almost like a church.
    *[continue] ->b
=b
- As you are walking, you see a shadowy figure behind one of the pillars. As you get closer, the figure comes to light; another one of these freaks. 
    *[continue]->c
=c
- St. Francis: Halt. I am St. Francis, guardian of the Wacy. You have made it this far, worm, but I cannot let you access The Seed of Wacy until you prove your worth as a wacy individual. 
    *[continue]->d
=d
- St. Francis: I have a list of questions three that you must answer before you are granted access to the Seed. Please put your phone in this bin before we begin.
    * [Put your phone in the bin]
        -> StFrancis
    * [You can't tell me what to do, PUNY BOY]
        -- St. Francis: You messed with the wrong motherfucker. I am NOT a puny boy.
        -- St. Francis pulls out his gun and shoots you. Game over.
            -> END
                
=== StFrancis ===
- St. Francis: Question 1: What is your favorite color?
    * [Red]
        -- St.Francis: Hmph. Average.
        {checkStat("Handstand", handstand, 1)}
            ** [Continue]->a
    * [Blue]
        -- St.Francis: You seem annoying.
        {checkStat("Film Buff", filmBuff, 1)}
            ** [Continue]->a
    * [Green]
        -- St. Francis: Weird.
        {checkStat("Italian", italian, 1)}
            ** [Continue]->a
    * [Pink]
        -- St. Francis: Freak.
        {checkStat("Avant Garde", avantGarde, 1)}
            ** [Continue]->a
    * [Yellow]
        -- St.Francis: I mean it IS a good color.
            {checkStat("Wacy", wacy, 3)}
            ** [Continue]->a
=a
- St. Francis: Question 2: Are you affiliated with the federal government?
    * [No]
        {isCop:
            St. Francis: Fool. This was to test your loyalty. Pranzo told me everything I needed to know.
            St. Francis pulls out a gun and shoots you. ->END
        -else:
            St. Francis: Aight. 
                * [Continue]->b
        }
    * [Yes]
        -- St. Francis: Disguisting. 
        {checkStat("Wacy", wacy, -2)}
            ** [Continue]->b
=b
- St. Francis: Question 3: Do you think killing people is bad?
    * [Yeah it's pretty bad]
        -- St. Francis: Shut the fuck up. This game isn't a commentary on morality. Idiot.
        {checkStat("Wacy", wacy, -1)}
            ** [Continue]->c
    * [Yeah definitely]
        -- St. Francis: Shut the fuck up. This game isn't a commentary on morality. Idiot.
        {checkStat("Wacy", wacy, -1)}
            ** [Continue]->c
    * [No, we all die someday]
        -- St. Francis: Shut the fuck up. This game isn't a commentary on morality. Idiot.
        {checkStat("Wacy", wacy, -1)}
            ** [Continue]->c
=c
- St.Francis: Alright I must be honest with you, I made the questions up to keep you on your toes. 
- Now I will now evaluate your Waciness…
    * {wacy < 0} [Continue]->da
    * {wacy > 0 && wacy <= 10} [Continue]->db
    * {wacy > 10} [Continue]->dc
    * ->db
=da
- St. Francis: WHAT IS THIS? You are easily the least wacy individual I’ve ever met. You are boring, bland. This cannot exist within the Land of Wacy. BEGONE!
    -- St. Francis shoots you. You die. ->END
=db
- St. Francis: I see.. You really ARE a wacy individual. I apologize for judging you so harshly. Please, continue into the tower.
    * [Continue]->e
=dc
- St. Francis: You are so wacy it is actually horrifying. Are you even human?
    * [Continue]->e
=e
- St. Francis: You've passed the wacy test. Good luck with pesto.
    * [Thanks dude]->prePesto
    * {handstand >= 8} [Do a handstand]
        {checkStat("Handstand", handstand, 2)}
        -- St. Francis: By the GODS!
            ** [Continue] ->prePesto
    
=== prePesto ===
- You climb up to the top of the tower. There you see a little green dude, just chillin.
    * [Continue]->a
=a
- Pesto: Oh hey man. I'm Pesto. ->pesto

=== pesto ===
    * [hey man]
        -- Pesto: Lol sup ->pesto
    * [THE SEED! NOW!]
        -- Pesto: What the fuck ok chill out man->pesto
    * [What were you doing with the Seed of Wacy?]
        -- Pesto: Idk lol i was just checking it out
            ** [oh ok]
                --- Pesto: Yeah lmao ->pestoAsk
            ** [I don't believe you]
                --- Pesto: Wtf why not
                    *** [Because you STOLE it]
                        ---- Pesto: Not really it was kinda just there
                            **** [What do you mean it was kinda just there??]
                                ----- Pesto: Like its just there in the wacy no one was using it so i just checked it out lay off my ass already jesus
                                    ***** [Continue] ->pestoAsk
                
=pestoAsk
- Pesto: do you like, need it or something
    * [Yes it's my rightful quest]
        -- Pesto: Uh huh. Sure whatever it's yours man
        ** [Continue] ->getSeed
    * [Yeah but if you want to borrow it for a bit its cool]
        -- Pesto: Nah its all good dw about it i have some other things to do anyways
        ** [Ok thanks]
            --- Pesto: No problem dude
            *** [Continue] ->getSeed
        ** [I insist, you take it Pesto]
            --- Pesto: Dude you're kinda supposed to take it there is no like secret pesto ending just take it for real
            *** [Continue] ->getSeed

=getSeed
- Pesto: Alright cool glad that's settled. Im gonna go get high and watch youtube video essays so can you kindly get out now please
    * [Leave with the seed] -> ending
    * {handstand >= 10} [Do a handstand]
        -- you try to do a handstand. Your arms can't take it anymore and fall off. ->END
    
=== ending ===
- Tito rides up to the tower in his Prius with the other Pyoros.
*[Continue]->a
=a
- Tito: Hey man. You made it real far. Proud of you hotshot.{firstHandstand: I knew from the second I saw the handstand you were ready to take the Seed of Wacy for yourself.}{complain: I told you it would be fun. It was fun right? Dont know why you were such a dick about it.}
*[Continue]->b
=b
- With the Seed of Wacy in your hands, you now possess the pure, unfiltered energy of the avant-garde, the silly, and the funny. The Pyoros take turns fist bumping you. You are the Wacy. You can now wake up. ->END


// this sucks so much ass but inky was giving me trouble for no reason with basic stuff so whatever idc
=== function checkStat(name, stat, amt) ===
{name == "Avant Garde":
    ~avantGarde += amt
    {amt >= 0:
    \+{amt} {name}: {avantGarde}
- else:
    \-{amt*-1} {name}: {avantGarde}
}
}
{name == "Italian":
    ~italian += amt
    {amt >= 0:
    \+{amt} {name}: {italian}
- else:
    \-{amt*-1} {name}: {italian}
}
}
{name == "Film Buff":
    ~filmBuff += amt
    {amt >= 0:
    \+{amt} {name}: {filmBuff}
- else:
    \-{amt*-1} {name}: {filmBuff}
}
}
{name == "Wacy":
    ~wacy += amt
    {amt >= 0:
    \+{amt} {name}: {wacy}
- else:
    \-{amt*-1} {name}: {wacy}
}
}
{name == "Handstand":
    ~handstand += amt
    {amt >= 0:
    \+{amt} {name}: {handstand}
- else:
    \-{amt*-1} {name}: {handstand}
}
}






    



        

