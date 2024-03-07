# Привилегии для `Administarot_FrontHub`@`%`

GRANT USAGE ON *.* TO `Administarot_FrontHub`@`%` IDENTIFIED BY PASSWORD '*FE1DA99C6C41AF33A5985BDEFDB2B4A9A9348662';

GRANT ALL PRIVILEGES ON `fronthub`.* TO `Administarot_FrontHub`@`%`;


# Привилегии для `Moderator_FrontHub`@`%`

GRANT USAGE ON *.* TO `Moderator_FrontHub`@`%` IDENTIFIED BY PASSWORD '*A5FBB1A6B4F929DBCFC618297DCDCDD22BD7CBE8';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, SHOW VIEW ON `fronthub`.* TO `Moderator_FrontHub`@`%`;


# Привилегии для `User_FronHub`@`%`

GRANT USAGE ON *.* TO `User_FronHub`@`%` IDENTIFIED BY PASSWORD '*EA3DFB578ABF2DBD862D502AF36DA33FB976BFA2';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, SHOW VIEW ON `fronthub`.* TO `User_FronHub`@`%`;