############## WORKS https://www.r-bloggers.com/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know/

library(readr)


library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(RWeka)



toaddressthirteen <- read_csv("~/towordcloud.csv")


docs <- Corpus(VectorSource(toaddressthirteen$ADDRESSES))

inspect(docs)

# Convert the text to lower case
#docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
#docs <- tm_map(docs, removeWords, c("street", "suite", "west", "avenue", "floor")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
# ... other tokenizers
tok <- BigramTokenizer
tdmgram <- TermDocumentMatrix(df.corpus, control = list(tokenize = tok))
#... create wordcloud

dtm <- TermDocumentMatrix(tdmgram)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=Inf, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

################# TRYING TO GET PHRASES WORKING


############## https://www.r-bloggers.com/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know/

library(readr)


library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(RWeka)



toaddressthirteen <- read_csv("~/towordcloud.csv")


docs1 <- Corpus(VectorSource(toaddressthirteen$ADDRESSES))

docs<-table(docs1)

inspect(docs)

# Convert the text to lower case
#docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
#docs <- tm_map(docs, removeWords, c("street", "suite", "west", "avenue", "floor")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
# ... other tokenizers
tok <- BigramTokenizer
tdmgram <- TermDocumentMatrix(df.corpus, control = list(tokenize = tok))
#... create wordcloud

dtm <- TermDocumentMatrix(tdmgram)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,scale=c(4,.5),
          max.words=Inf, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


##################


library(wordcloud)
library(readr)
library(RColorBrewer)

toaddressthirteen <- read_csv("~/towordcloud.csv")




df<-data.frame(theNames=c(toaddressthirteen$ADDRESSES))
tb<-table(df$theNames)
wordcloud(names(tb),as.numeric(tb), min.freq=5,max.words=Inf, 
          random.order=FALSE, rot.per=0.35, colors=brewer.pal(8, "Dark2"))


