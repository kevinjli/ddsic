# ddsic

Academic Decathlon is a competition for high school students involving teams of 3 "A," 3 "B," and 3 "C" GPA average students, all of whom compete in ten events: art, economics, essay, interview, language and literature, mathematics, music, science, social science, and speech. The events, except for interview, mathematics, and speech, are based on a theme (such as "World War I" or "New Alternatives in Energy: Ingenuity and Innovation") that changes each year. Competitions are generally held at the regional, state, and national levels.

The **DemiDec Scores and Information Center** is a wiki located [here](http://demidecscores.gilslotd.com/wiki/Main_Page), that aims to compile a record of Academic Decathlon scores from around the nation. Since wiki formatting is generally cumbersome and difficult to edit in, this repo aims to make it easier to edit by providing a tool that converts plain-text scores into tables.

The script *table.pl* converts scores from a file, each on one line with the form: *Name, School Score* into the source for a table that ranks and sorts those scores, colors cells for medal-winners, adds commas, etc. To see examples of such tables, check out the DDSIC results of the last national competition [here](http://demidecscores.gilslotd.com/wiki/Nationals/2013).

Additional columns, such as state or region, can easily be added to the script by modifying the pattern to extract the relevant information and present it in wiki syntax.

Typical use:

    perl table.pl input.txt > output.txt
