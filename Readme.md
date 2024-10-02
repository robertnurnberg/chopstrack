# chopstrack

Track the evaluations of the book exits from [`chops.pgn`](chops.pgn)
on [chessdb.cn](https://chessdb.cn/queryc_en/) (cdb). The name of the book
stands for Complex Human OPeningS.
The book was created by Joost VandeVondele in October 2024, and was originally
named
`book_caissa_minElo2500_maxPlies24_cdb-082-102_softmax_d4_a10_4d_0.99_1.5d.pgn`
when it was announced on [discord](https://discord.com/channels/435943710472011776/1101022188313772083/1290411267412066399). It contains a total of
7320 lines from games in [Caissabase](http://www.caissabase.co.uk) that were
played between 2500+ Elo human players and that lead to positions that
current engines judge to be on the edge between a win and a draw. In addition,
the positions were chosen so that for the next two full moves 
both sides have a variety of playable options,
meaning that (engine) games starting from these positions are likely to 
diverge quickly.
 
The lines in `chops.pgn` are between 2 and 24 plies long, with an average of 
16 plies. They lead to a total of 3797 unique positions (FENs with move
counters), stored in 
[`chops_with_move_counters.epd`](chops_with_move_counters.epd), amongst which 
are 3588 unique positions (EPDs without move counters), stored in 
[`chops.epd`](chops.epd).
This repo tracks the evaluations of the positions in `chops.epd` on cdb.
On cdb they have an average depth of 16.6 plies, as well as 30.6 pieces on
average. No position has fewer than 22 pieces on the board.

The file [`chops_cdbpv.epd`](chops_cdbpv.epd) 
contains the current cdb evaluations and PVs for each position. It is created 
daily with the help of the script `cdbbulkpv.py` from 
[cdblib](https://github.com/robertnurnberg/cdblib), and the obtained statistics
are written to [`chopstrack.csv`](chopstrack.csv).
Moreover, each day the hundred positions with the currently shortest PVs on cdb
(ignoring PVs ending in a two-fold repetition)
are written to [`chops_daily_shortest.epd`](chops_daily_shortest.epd), and
the positions with absolute evaluations in the interval [80, 110]
are written to [`chops_daily_edgy.epd`](chops_daily_edgy.epd).

---

<p align="center"> <img src="chopstrack.png?raw=true"> </p>

---

<p align="center"> <img src="chopstrackpv.png?raw=true"> </p>

---

## Progress

The following graph attempts to measure the progress cdb makes in exploring
and evaluating the positions in `chops.epd`. See
[caissatrack](https://github.com/robertnurnberg/caissatrack)
for a precise description of the plotted indicators.

<p align="center"> <img src="chopstracktime.png?raw=true"> </p>

---

## Get in touch

To discuss anything cdb related, and to help cdb grow at a healthy pace, join
other (computer) chess enthusiasts at the [chessdbcn channel](
https://discord.com/channels/435943710472011776/1101022188313772083) on the
[Stockfish discord server](https://discord.gg/ZzJwPv3).
