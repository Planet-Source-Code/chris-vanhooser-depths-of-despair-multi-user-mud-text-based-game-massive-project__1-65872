Attribute VB_Name = "modSuicide"
'
'----------------------------------------------------------
' Project   : DoDMudServer
' Module    : modSuicide
' Author    : Chris Van Hooser
' Copyright : 2004, Spike Technologies, Chris Van Hooser
' Email     : spike.spikey@comcast.net
'----------------------------------------------------------
'
Public Function Suicide(Index As Long) As Boolean
If modSC.FastStringComp(LCaseFast(Left(X(Index), 7)), "suicide") Or modSC.FastStringComp(LCaseFast(Left$(X(Index), 2)), "ðy") Or modSC.FastStringComp(LCaseFast(Left$(X(Index), 2)), "ðn") Or modSC.FastStringComp(LCaseFast(Left$(X(Index), 1)), "ð") Then
    Suicide = True
    If modSC.FastStringComp(X(Index), "ð") Then X(Index) = "": Speaking Index
    Select Case LCaseFast(Left$(X(Index), 2))
        Case "su"
            WrapAndSend Index, RED & "Are you sure? Y/N" & vbCrLf & WHITE
            X(Index) = "ð"
        Case "ðy"
            dbPlayers(GetPlayerIndexNumber(Index)).lHP = -100
            CheckDeath Index
            X(Index) = ""
            Speaking Index
        Case "ðn"
            X(Index) = ""
            Speaking Index
        Case Else
            X(Index) = ""
            Speaking Index
    End Select
End If
End Function

Public Function ReRoll(Index As Long) As Boolean
If modSC.FastStringComp(LCaseFast(Left(X(Index), 7)), "reroll") Or modSC.FastStringComp(LCaseFast(Left$(X(Index), 2)), "þy") Or modSC.FastStringComp(LCaseFast(Left$(X(Index), 2)), "þn") Or modSC.FastStringComp(LCaseFast(Left$(X(Index), 1)), "þ") Then
    ReRoll = True
    If modSC.FastStringComp(X(Index), "þ") Then X(Index) = "": Speaking Index
    Select Case LCaseFast(Left$(X(Index), 2))
        Case "re"
            WrapAndSend Index, RED & "Are you sure? Y/N" & vbCrLf & WHITE
            X(Index) = "þ"
        Case "þy"
            With dbPlayers(GetPlayerIndexNumber(Index))
                .lHP = lDeath - 100
                .iLives = 1
            End With
            CheckDeath Index
            X(Index) = ""
            Speaking Index
        Case "þn"
            X(Index) = ""
            Speaking Index
        Case Else
            X(Index) = ""
            Speaking Index
    End Select
End If
End Function
