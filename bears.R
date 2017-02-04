dat=read.csv("BearFatalities.csv")
str(dat)

library(ggplot2)


bear.species=ggplot(dat,aes(year,fill=species))+
geom_bar()+
scale_fill_manual(values=c("gray26","burlywood4","deepskyblue"))+
labs(x="Year",y="Fatalities")+
theme(panel.background = element_blank())+
theme(axis.title.y=element_text(vjust=0.1,size=12),axis.title.x=element_text(vjust=-.4,size=12),
axis.text=element_text(size=10))+
guides(fill=guide_legend(title=NULL))
ggsave("bearspecies.png",bear.species,width=8,height=3,units="in",dpi=1600)



loc.type=ggplot(dat,aes(x=factor(1),fill=location.type))+
geom_bar(width=1)+
coord_polar(theta="y")+
theme(panel.background = element_blank())+
labs(x="",y="")+
theme(axis.text.y=element_blank(),axis.ticks.y=element_blank())+
guides(fill=guide_legend(title=NULL))
ggsave("loctype.png",loc.type,width=4,height=3,units="in",dpi=1600)


2016-1980

# 36 years, 89 records

89/36

# mean attacks/year is 2.47

summary(dat$species)

# 37 black bear, 47 brown bear, and 5 polar bear

summary(dat$country)

# 39 canada, 50 usa

summary(dat$location.type)

# captive bear  country club          home       in town military base 
#           5             1             7             3             1 
#      nature     oil field 
#          69             3 

dat[dat$location.type=="in town",]

# this ended up being unnecessary but I want to save this code

library(data.table)

dt=data.table(dat,key=c("year","species"))
dt[ , count := .N, by = list(year, species)]



