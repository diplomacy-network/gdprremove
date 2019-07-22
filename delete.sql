START TRANSACTION;
SET @uid = 3122;
SET @deletedpassword = "Enter Password here";

DELETE FROM wD_AccessLog WHERE userID = @uid;
DELETE FROM wD_AccessLogAdvanced WHERE userID = @uid;
DELETE FROM wD_AdminLog WHERE id = @uid;
DELETE FROM wD_Backup_Members WHERE userID = @uid;
DELETE FROM wD_BannedNumbers WHERE userID = @uid;
DELETE FROM wD_BlockUser WHERE userID = @uid;
DELETE FROM wD_CivilDisorders WHERE userID = @uid;
DELETE FROM wD_CountrySwitch WHERE fromID = @uid OR toID = @uid;
DELETE FROM wD_ForceReply WHERE toUserID = @uid;
DELETE FROM wD_ForumMessages WHERE fromUserID = @uid;
DELETE FROM wD_LikePost WHERE userID = @uid;
-- DELETE FROM wD_Members WHERE userID = @uid;
DELETE FROM wD_ModeratorNotes WHERE fromUserID = @uid;
DELETE FROM wD_ModForumMessages WHERE fromUserID = @uid;
DELETE FROM wD_MuteCountry WHERE userID = @uid;
DELETE FROM wD_MuteThread WHERE userID = @uid;
DELETE FROM wD_MuteUser WHERE userID = @uid;
DELETE FROM wD_NMRs WHERE userID = @uid;
DELETE FROM wD_Notices WHERE toUserID = @uid;
DELETE FROM wD_PointsTransactions WHERE userID = @uid;
DELETE FROM wD_Ratings WHERE userID = @uid;
DELETE FROM wD_Sessions WHERE userID = @uid;
DELETE FROM wD_Silences WHERE userID = @uid;
DELETE FROM wD_TelegramService WHERE UserID = @uid;
-- DELETE FROM wD_Users WHERE id = @uid;

UPDATE wD_Members SET status = 'Left', timeLoggedIn = NULL WHERE status = 'Playing' AND userID = @uid;
UPDATE wD_Backup_Members SET status = 'Left', timeLoggedIn = NULL WHERE status = 'Playing' AND userID = @uid;

UPDATE wD_Users SET username = CONCAT('deletedUser#', @uid), email = CONCAT(@uid, "@deleted.de"), comment = NULL, homepage = NULL, hideEmail = 'Yes', timeJoined = 0, timeLastSessionEnded = 0, lastMessageIDViewed = 0, password = @deletedpassword, cdCount = 100, nmrCount = 100, cdTakenCount = 0, reliabilityRating = 1, deletedCDs = 0, missedMoves = 100, phasesPlayed = 0, lastModMessageIDViewed = 0, rlGroup = 0, colorCorrect = 'Off' WHERE id = @uid;


COMMIT;

