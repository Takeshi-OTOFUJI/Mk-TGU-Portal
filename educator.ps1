$week=("月", "火", "水", "木", "金", "土" )
$manaba_head="https://tohoku-gakuin.manaba.jp/ct/course_"
$manaba_ent=("page", "rptadm?action=rptlist", "queryadm_examlist", "news?action=listadm", "topics", "surveyadm_examlist", "projadm")
$manaba_lbl=("コ", "レ", "テ", "ニ", "掲", "ア", "プ")
$outfile="授業.html"

$line = ( Get-Content $Args[0] ) -as [string[]]
$line = $line[1..$Line.Length]
$aa =@{}
foreach ($l in $line) {
    $entry = $l.Split(",")
    $aa[$entry[0]+$entry[1]] = $l
}

write-output '<html lang="ja">
<head>
<meta charset="UTF-8">
</head>
<body>
<ul>
<li><a href="https://portal.tohoku-gakuin.jp/">MyTG</a>
<li><a href="https://tohoku-gakuin.manaba.jp/ct/home">Manaba</a>
</ul>
<table border="1">
  <tbody>
  <tr><td></td><td>月</td><td>火</td><td>水</td><td>木</td><td>金</td><td>土</td></tr>' |  Out-File $outfile -Encoding UTF8


for($i=1; $i -le 5; $i++ ) {
write-output '<tr>' |Out-File $outfile -Encoding UTF8 -Append
write-output "<td>$i</td>" | out-file $outfile -Encoding UTF8 -Append
  foreach($w in $week ) {
    Write-Output '<td>' | out-file  $outfile -Encoding UTF8 -Append
    $k=$w+$i
    if( $aa[$k].count -ne 0 ) {
       $e=$aa[$k].Split(",")
       $o =$o ='<a href="'
       $o +=$manaba_head + $e[3] 
       $o += '">'
       $o += $e[2] + '</a><br>'
       write-output $o | out-file $outfile -Encoding UTF8 -Append
       for($c=4; $c -lt 11; $c++ ) {
         if( $e[$c] -ne "" ) {
           $o ='<a href="'
           $o +=$manaba_head + $e[3] + '_' + $manaba_ent[$c-4]
           $o += '">' + $manaba_lbl[$c-4] + '</a> '
           write-output $o | out-file $outfile -Encoding UTF8 -Append
         }
       }
    }
    Write-Output '</td>' | out-file $outfile -Encoding UTF8 -Append
  }
  write-output '</tr>' | out-file $outfile -Encoding UTF8 -Append
}

write-output '  </tbody>
</table>
</body>
</html>' | out-file $outfile -Encoding UTF8 -Append
