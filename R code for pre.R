hr_df <-read.csv("D:/Rlearn/big data/new edited.csv")
View(hr_df)

##addition model
dat$x5=relevel(dat$x5,ref="1")
fitlm=lm(number~yearag+MA,data=dat) 
summary(fitlm) 

##multiplication model
dat$x5=relevel(dat$x5,ref="m")
fitlm2=lm(number~yearag+yearag:MA,data=dat) 
summary(fitlm2)  

##mixed model
fitlm3=lm(number~yearag+MA+yearag:MA,data=dat)
summary(fitlm3)  


##downsize(grad year >2005)
narrow <- subset(hr_df, ugrad_year>2005)

##keep the donation relevented and divided into LTW and annual giving campaign
LTW <- subset(narrow, campaign == "Light the World")
Annualgiving <- subset(narrow, campaign == "Annual Giving Campaign")

##downsize(grad year >2005)
since2006 <- subset(hrdf, ugrad_year > 2005)
View(since2006)

##how many students from each state
table(since2006$home_state)

##how many LTW sent emails were sent to each state
table(LTW$home_state)

##how many LTW sent emails were opened in each state
table(LTW$home_state, LTW$email_open == 1)

##how many LTW sent emails were clicked in each state
table(LTW$home_state, LTW$click == 1)

##how many Annualgiving sent emails were sent to each state
table(Annualgiving$home_state)

##how many Annualgiving sent emails were opened in each state
table(Annualgiving$home_state, Annualgiving$email_open == 1) 

##how many Annualgiving sent emails were clicked in each state
table(Annualgiving$home_state, Annualgiving$click == 1)


##people who received LTW emails don't donate 
NonDLTW <- subset(LTW, donate == 0)

table(NonDLTW$home_state)

table(NonDLTW$home_state,NonDLTW$email_open == 1)

table(NonDLTW$home_state,NonDLTW$click == 1)

##people who received Annualgiving emails don't donate 
NonDAnnualgiving <- subset(Annualgiving, donate == 0)

table(NonDAnnualgiving$home_state)

table(NonDAnnualgiving$home_state, NonDAnnualgiving$email_open == 1)

table(NonDAnnualgiving$home_state, NonDAnnualgiving$click == 1)


