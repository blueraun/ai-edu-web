$filePath = 'C:\Users\user\Documents\AI 교육웹 개발\index.html'
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

$scriptStart = $content.IndexOf('<script type="text/babel"')
$scriptEnd = $content.IndexOf('</script>', $scriptStart)

$before = $content.Substring(0, $scriptStart)
$script = $content.Substring($scriptStart, $scriptEnd - $scriptStart)
$after = $content.Substring($scriptEnd)

$chars = $script.ToCharArray()
$result = [System.Text.StringBuilder]::new()
$i = 0

while ($i -lt $chars.Length) {
    $ch = $chars[$i]

    if ($ch -eq '"') {
        [void]$result.Append($ch)
        $i++
        while ($i -lt $chars.Length) {
            $c = $chars[$i]
            if ($c -eq '\') {
                [void]$result.Append($c)
                $i++
                if ($i -lt $chars.Length) {
                    [void]$result.Append($chars[$i])
                    $i++
                }
            } elseif ($c -eq '"') {
                [void]$result.Append($c)
                $i++
                break
            } elseif ($c -eq "`n") {
                [void]$result.Append('\n')
                $i++
            } elseif ($c -eq "`r") {
                $i++
            } else {
                [void]$result.Append($c)
                $i++
            }
        }
    } elseif ($ch -eq '`') {
        # Template literal - keep as-is
        [void]$result.Append($ch)
        $i++
        while ($i -lt $chars.Length) {
            $c = $chars[$i]
            if ($c -eq '\') {
                [void]$result.Append($c)
                $i++
                if ($i -lt $chars.Length) {
                    [void]$result.Append($chars[$i])
                    $i++
                }
            } elseif ($c -eq '`') {
                [void]$result.Append($c)
                $i++
                break
            } else {
                [void]$result.Append($c)
                $i++
            }
        }
    } else {
        [void]$result.Append($ch)
        $i++
    }
}

$newContent = $before + $result.ToString() + $after
[System.IO.File]::WriteAllText($filePath, $newContent, [System.Text.Encoding]::UTF8)
Write-Host 'Done'
