import discord
import asyncio
import os
import mysql.connector
from discord.ext import commands

client = commands.Bot(command_prefix='!')

@client.event
async def on_ready():
    print("Bot is ready!")
    
@client.command()
async def ping(ctx):
    await ctx.send(f'Pong! {round(client.latency * 1000)}ms')
    
    
@client.command()
async def resetall(ctx):
    if ctx.author.guild_permissions.administrator:
        sql = mysql.connector.connect(
            host = "62.171.159.104",
            database = "gtav_rp3",
            user = "root",
            password = "643gw6543vw",
        )
        cursor = sql.cursor()
        cursor.execute("UPDATE characters_cars SET vehicle_state = 'In'")
        sql.commit()
        sql.close()
        await ctx.send("All vehicles have been reset!")
    else:
        await ctx.send("You do not have permission to use this command!")
        
@client.command()
async def resetcid(ctx, cid):
    sql = mysql.connector.connect(
            host = "62.171.159.104",
            database = "gtav_rp3",
            user = "root",
            password = "643gw6543vw",
        )
    cursor = sql.cursor()
    cursor.execute("UPDATE characters_cars SET vehicle_state = 'In' WHERE cid = %s", (cid,))
    sql.commit()
    sql.close()
    await ctx.send("All vehicles have been reset for this character with the CID of " + cid + "!")

@client.command()
async def resetpd(ctx):
    sql = mysql.connector.connect(
            host = "62.171.159.104",
            database = "gtav_rp3",
            user = "root",
            password = "643gw6543vw",
        )
    cursor = sql.cursor()
    cursor.execute("UPDATE characters_cars SET vehicle_state = 'In' WHERE garage_info = %s", ("law",))
    sql.commit()
    sql.close()
    await ctx.send("All PD vehicles have been reset!")

client.run("OTUzNTIxNzYyMjI4OTIwMzkw.YjFyVw.Kj71YBhfmYWt-Ox003O72yarMMA", bot=True)