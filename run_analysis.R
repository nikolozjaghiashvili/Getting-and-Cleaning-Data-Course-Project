# Reading the test & train datasets
table1 = read.table("X_test.txt", header = FALSE)
table2 = read.table("X_train.txt", header = FALSE)

# Assigning descriptive variable names to the dataset
head1 = read.table("features.txt")
head = head1[,2]
colnames(table1) = head
colnames(table2) = head

# Reading label and subject datasets
table3 = read.table("y_test.txt")
table4 = read.table("y_train.txt")
table5 = read.table("subject_test.txt")
table6 = read.table("subject_train.txt")
colnames(table3) = "activity"
colnames(table4) = "activity"
colnames(table5) = "subject"
colnames(table6) = "subject"

# Forming the combined dataset
test = cbind(table3,table5,table1)
train = cbind(table4,table6,table2)
dataset = rbind(test,train)

# Extacting Standard deviation and mean variables
index = grep("std|mean()",names(dataset))
dataset = dataset[,c(1,2,3,index)]
names(dataset)

# Matching activity names to the activity lables in the dataset
activity = data.frame(1:6,c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
colnames(activity) = c("activity", "label")
dataset1 = merge(dataset,activity, by = "activity", sort = FALSE)
dataset = cbind(dataset1$label,dataset)
names(dataset)[1] = "activity-name"

# Creating separate dataset containing means, based on activity and subject
library(reshape2)
datasetmelt = melt(dataset, id = c("activity","subject"), measure.vars = (names(dataset)[4:83]))
datasetcast = dcast(datasetmelt, subject + activity ~ variable, mean)


write.table(datasetcast, file = "tidydata.txt",row.name=FALSE)