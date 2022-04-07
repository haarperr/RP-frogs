import discord
import asyncio
import os
import mysql.connector
from discord.ext import commands

client = commands.Bot(command_prefix='!')
mysql = mysql.connector.connect(
    host = "62.171.159.104",
    database = "gtav_rp3",
    user = "root",
    password = "643gw6543vw",
)

@client.event
async def on_ready():
    print("Bot is ready!")
    
@client.command()
async def ping(ctx):
    await ctx.send(f'Pong! {round(client.latency * 1000)}ms')
    
    
@client.command()
async def resetall(ctx):
    if ctx.author.guild_permissions.administrator:
        cursor = mysql.cursor()
        cursor.execute("UPDATE characters_cars SET vehicle_state = 'In'")
        mysql.commit()
        await ctx.send("All vehicles have been reset!")
    else:
        await ctx.send("You do not have permission to use this command!")
        
@client.command()
async def resetcid(ctx, cid):
    if ctx.author.guild_permissions.administrator:
        cursor = mysql.cursor()
        cursor.execute("UPDATE characters_cars SET vehicle_state = 'In' WHERE cid = %s", (cid,))
        mysql.commit()
        await ctx.send("All vehicles have been reset for this character with the CID of " + cid + "!")
    else:
        await ctx.send("You do not have permission to use this command!")

client.run("OTUzNTIxNzYyMjI4OTIwMzkw.YjFyVw.Kj71YBhfmYWt-Ox003O72yarMMA", bot=True)